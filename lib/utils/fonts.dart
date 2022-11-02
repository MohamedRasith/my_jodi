import 'package:flutter/material.dart';

import 'constants.dart';

class FontConstants {
  static const String fontPoppins = "Poppins";
}


class AppFonts {
  static TextStyle extraBoldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.w800,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle boldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = AppColors.textColor4B,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle semiBoldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = AppColors.textColor4B,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle mediumStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = AppColors.textColor4B,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle lightStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.w300,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }


  static TextStyle regularStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }


  static TextStyle extraRegularStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.w300,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle thinStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.5,
    String fontType = FontConstants.fontPoppins,
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.w200,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = Colors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }



}
