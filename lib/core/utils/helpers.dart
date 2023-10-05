import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../exceptions/exceptions.dart';
import '../exceptions/failure.dart';
import 'alert.dart';

Future<Either<Failure, T>> runWithTryCatch<T>(
    {required Function recall}) async {
  try {
    T result = await recall();
    return Right(result);
  } on BaseException catch (err) {
    showErrorMessages(err.failure);

    return Left(err.failure);
  } catch (err, stacktrace) {
    if (kDebugMode) {
      print(err);
      print(stacktrace);
    }
    return Left(SystemFailure(
        const {
          "error": ["System failure"]
        },
        500,
        stacktrace,
        {"error": err},
        2000));
  }
}

void showErrorMessages(Failure failure) {
  if (failure.messages != null) {
    failure.messages!.forEach((key, value) {
      switch (key) {
        case 'warning':
          {
            if (value is List) {
              for (var message in value) {
                Alert.warning(message: message);
              }
            }
          }
          break;
        case 'danger':
          {
            if (value is List) {
              for (var message in value) {
                Alert.danger(message: message);
              }
            }
          }
          break;
        case 'info':
          {
            if (value is List) {
              for (var message in value) {
                Alert.info(message: message);
              }
            }
          }
          break;
        default:
          {
            if (value is List) {
              for (var message in value) {
                Alert.warning(message: message);
              }
            }
          }
      }
    });
  }
}

Map<int, Color> getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  /// if [500] is the default color, there are at LEAST five
  /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
  /// divisor of 5 would mean [50] is a lightness of 1.0 or
  /// a color of #ffffff. A value of six would be near white
  /// but not quite.
  const lowDivisor = 6;

  /// if [500] is the default color, there are at LEAST four
  /// steps above [500]. A divisor of 4 would mean [900] is
  /// a lightness of 0.0 or color of #000000
  const highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}
