import 'package:test_app/core/theme/colors/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/theme/colors/theme_colors.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  static const blackBold24 = TextStyle(
    color: ThemeColors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const greyRegular16 = TextStyle(
    color: ThemeColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const redRegular16 = TextStyle(
    color: ThemeColors.red,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const greyC3Regular16 = TextStyle(
    color: ThemeColors.greyC3,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

}
