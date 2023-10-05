import 'package:flutter/material.dart';

import '../../main.dart';
import '../../theme/constants.dart';

class Alert {
  static SnackBar getSnackBar(Color color, String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      backgroundColor: color,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 20,
    );
  }

  static success({required String message}) {
    if (snackbarKey.currentState != null) {
      snackbarKey.currentState!
          .showSnackBar(getSnackBar(successColor, message));
    }
  }

  static warning({
    required String message,
  }) {
    if (snackbarKey.currentState != null) {
      snackbarKey.currentState!
          .showSnackBar(getSnackBar(warningColor, message));
    }
  }

  static danger({required String message}) {
    if (snackbarKey.currentState != null) {
      snackbarKey.currentState!.showSnackBar(getSnackBar(errorColor, message));
    }
  }

  static info({required String message}) {
    if (snackbarKey.currentState != null) {
      snackbarKey.currentState!
          .showSnackBar(getSnackBar(primaryColor, message));
    }
  }
}
