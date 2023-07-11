import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/theme/colors/theme_colors.dart';
import 'package:test_app/core/utils/app_utils.dart';

class MySnackBar {
  MySnackBar._();

  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    Flushbar(
      maxWidth:MediaQuery.of(context).size.width,
      flushbarPosition: FlushbarPosition.TOP,
      margin: AppUtils.kPaddingAll16,
      icon: const Icon(
        Icons.error,
        size: 42,
        color: ThemeColors.white,
      ),
      message: message,
      messageColor: ThemeColors.white,
      backgroundColor: ThemeColors.red,
      borderRadius: AppUtils.kBorderRadius12,
      borderColor: ThemeColors.red,
      duration: const Duration(milliseconds: 2000),
    ).show(context);
  }

}
