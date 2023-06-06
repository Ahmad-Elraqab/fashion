import 'package:flutter/material.dart';
// Colors

Color titleActive = const Color(0XFF000000);
Color body = const Color(0XFF333333);
Color label = const Color(0XFF555555);
Color placeholder = const Color(0XFF888888);
Color line = const Color(0XFFE0CFBA);
Color inputBackground = const Color(0XFFF9F9F9);
Color background = const Color(0XFFF8F0E7);
Color offWhite = const Color(0XFFFCFCFC);
Color lightBlue = const Color(0XFFE7EAEF);
Color primary = const Color(0XFFA8715A);
Color secondary = const Color(0XFFDD8560);
Color cardBg = const Color(0XFFF2F2F2);
Color font1 = const Color(0XFF202224);
Color font2 = const Color(0XFF727272);
Color gy = const Color(0XFFC4C4C4);

// Fonts

var title = getStyle(1.0, 4.0, 18.0, font1);
var subTitle = getStyle(1.0, 2.0, 16.0, font1);
var subTitle2 = getStyle(1.0, 2.0, 14.0, font1);
var subTitle3 = getStyle(1.0, 1.0, 14.0, placeholder);
var subTitle4 = getStyle(1.0, 1.0, 14.0, font1);
var bodyLarge = getStyle(1.0, 0.0, 16.0, titleActive);
var bodyMedium = getStyle(1.0, 0.0, 14.0, font2);
var bodySmall = getStyle(1.0, 0.0, 12.0, body);
var bodySmall2 = getStyle(1.0, 0.0, 15.0, primary);

TextStyle getStyle(
  height,
  space,
  size,
  color, {
  isItalic = false,
  family = 'TenorSans',
  fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      height: height,
      fontSize: size,
      letterSpacing: space,
      fontFamily: family,
      color: color,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      fontWeight: fontWeight,
    );
