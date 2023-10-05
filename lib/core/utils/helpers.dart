import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

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
