import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  /// divider
  static const kVerticalDivider = VerticalDivider(
    width: 1,
    thickness: 1,
    color: Color(0xFFE0E6ED),
  );

  static const kDivider = Divider(
    height: 1,
    thickness: 1,
    color: Color(0xFFE0E6ED),
  );
  static const kDivider0 = Divider();

  /// spacer
  static const kSpacer = Spacer();

  /// SizedBox
  static const kBox = SizedBox.shrink();
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight6 = SizedBox(height: 6);
  static const kBoxHeight8 = SizedBox(height: 8);
  static const kBoxHeight10 = SizedBox(height: 10);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight14 = SizedBox(height: 14);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight18 = SizedBox(height: 18);
  static const kBoxHeight20 = SizedBox(height: 20);
  static const kBoxHeight22 = SizedBox(height: 22);
  static const kBoxHeight24 = SizedBox(height: 24);
  static const kBoxHeight30 = SizedBox(height: 30);
  static const kBoxHeight40 = SizedBox(height: 40);
  static const kBoxHeight50 = SizedBox(height: 50);
  static const kBoxHeight54 = SizedBox(height: 54);

  static const kBoxWidth2 = SizedBox(width: 2);
  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth6 = SizedBox(width: 6);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth10 = SizedBox(width: 10);
  static const kBoxWidth12 = SizedBox(width: 12);
  static const kBoxWidth14 = SizedBox(width: 14);
  static const kBoxWidth16 = SizedBox(width: 16);
  static const kBoxWidth18 = SizedBox(width: 18);
  static const kBoxWidth20 = SizedBox(width: 20);
  static const kBoxWidth22 = SizedBox(width: 22);
  static const kBoxWidth24 = SizedBox(width: 24);
  static const kBoxWidth30 = SizedBox(width: 30);
  static const kBoxWidth40 = SizedBox(width: 40);
  static const kBoxWidth50 = SizedBox(width: 40);

  /// padding
  static const kPaddingAll2 = EdgeInsets.all(2);
  static const kPaddingAll30 = EdgeInsets.all(30);
  static const kPaddingHor30Top32 =
      EdgeInsets.only(left: 44, right: 44, top: 32);
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll10 = EdgeInsets.all(10);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingVer8Hor16 =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  static const kPaddingVer6Hor16 =
      EdgeInsets.symmetric(vertical: 6, horizontal: 16);
  static const kPaddingVer12Hor24 =
  EdgeInsets.symmetric(vertical: 12, horizontal: 24);
  static const kPaddingVer16Hor14 =
  EdgeInsets.symmetric(vertical: 16, horizontal: 14);
  static const kPaddingHor21Ver18 =
      EdgeInsets.symmetric(horizontal: 21, vertical: 18);
  static const kPaddingHor38 = EdgeInsets.symmetric(horizontal: 38);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingRight48 = EdgeInsets.only(right: 48);
  static const kPaddingLeft44Top25Right55 =
      EdgeInsets.only(left: 44, top: 25, right: 55);
  static const kPaddingLeft44Right38 = EdgeInsets.only(left: 44, right: 38);
  static const kPaddingLeft33Top44 = EdgeInsets.only(top: 44, left: 33);
  static const kPaddingLeft38Right19Top25 =
      EdgeInsets.only(left: 38, right: 19, top: 25);
  static const kPaddingBottom24 = EdgeInsets.only(bottom: 24);

  /// border radius
  static const kRadius = Radius.zero;
  static const kRadius2 = Radius.circular(2);
  static const kRadius4 = Radius.circular(4);
  static const kRadius6 = Radius.circular(6);
  static const kRadius8 = Radius.circular(8);
  static const kRadius10 = Radius.circular(10);
  static const kRadius12 = Radius.circular(12);
  static const kBorderRadius = BorderRadius.all(Radius.zero);
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius22 = BorderRadius.all(Radius.circular(22));
  static const kBorderRadius24 = BorderRadius.all(Radius.circular(24));
  static const kBorderRadius27 = BorderRadius.all(Radius.circular(27));
  static const kBorderRadius28 = BorderRadius.all(Radius.circular(28));
  static const kBorderRadius30 = BorderRadius.all(Radius.circular(30));
  static const kBorderRadius32 = BorderRadius.all(Radius.circular(32));
  static const kBorderRadius34 = BorderRadius.all(Radius.circular(34));
  static const kBorderRadius38 = BorderRadius.all(Radius.circular(38));
  static const kBorderRadius44 = BorderRadius.all(Radius.circular(44));
  static const kBorderRadius54 = BorderRadius.all(Radius.circular(54));

  static const kBorderRadiusBottom24 = BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight:  Radius.circular(24),
  );
}
