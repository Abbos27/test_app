import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_app/core/theme/text/theme_text_styles.dart';
import 'package:test_app/core/utils/app_utils.dart';
import 'colors/theme_colors.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  fontFamily: 'Manrope',
  splashColor: ThemeColors.primaryColor.withOpacity(0.01),
  focusColor: ThemeColors.primaryColor,
  colorSchemeSeed: ThemeColors.primaryColor,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: ThemeColors.secondaryColor.withOpacity(0.2),
    cursorColor: ThemeColors.secondaryColor,
    selectionHandleColor: ThemeColors.secondaryColor,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: 'Manrope',
      color: ThemeColors.black,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    backgroundColor: ThemeColors.whiteFE,
    scrolledUnderElevation: 0,
    elevation: 0,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
    },
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.zero,
      ),
    ),
  ),
  scaffoldBackgroundColor: ThemeColors.background,
  dividerTheme: const DividerThemeData(thickness: 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      splashFactory:
          Platform.isIOS ? NoSplash.splashFactory : InkRipple.splashFactory,
      elevation: MaterialStateProperty.all<double>(0),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return const Color(0xFFC4C4C9);
        }
        return ThemeColors.secondaryColor;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        return ThemeColors.white;
        // if (states.contains(MaterialState.disabled)) {
        //   return ThemeColors.disabledButtonTextColor;
        // } else {
        //   return ThemeColors.white;
        // }
      }),
      padding: MaterialStateProperty.all<EdgeInsets>(
        AppUtils.kPaddingVer6Hor16,
      ),
      maximumSize: MaterialStateProperty.all<Size>(
        const Size(double.infinity, 64),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        const Size(double.infinity, 64),
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size(double.infinity, 64),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: AppUtils.kBorderRadius6,
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: ThemeColors.secondaryColor,
    unselectedItemColor: ThemeColors.black,
    showUnselectedLabels: true,
    // selectedFontSize: 14,
    // unselectedFontSize: 14,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,

    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    unselectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    selectedIconTheme: IconThemeData(size: 24),
    unselectedIconTheme: IconThemeData(size: 24),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: AppUtils.kPaddingVer16Hor14,
    alignLabelWithHint: true,
    hintStyle: ThemeTextStyles.greyC3Regular16,
    prefixStyle: TextStyle(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.transparent,
        width: 1,
      ),
      borderRadius: AppUtils.kBorderRadius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.transparent,
        width: 1,
      ),
      borderRadius: AppUtils.kBorderRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.red,
        width: 1,
      ),
      borderRadius: AppUtils.kBorderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColors.transparent,
        width: 1,
      ),
      borderRadius: AppUtils.kBorderRadius,
    ),
    border: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius,
    ),
    filled: true,
    isDense: true,
    fillColor: ThemeColors.whiteFE,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
);
