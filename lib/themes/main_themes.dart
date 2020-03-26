import 'package:flutter/material.dart';

ThemeData mainThemes() {
  return ThemeData(
      primaryColor: Colors.white,
      accentColor: Color(0xFF5EBF46),
      cursorColor: Colors.white,
      textTheme: TextTheme(
          subtitle: fontFamily(FontWeight.w400),
          body2: fontFamily(FontWeight.w400),
          button: fontFamily(FontWeight.w500),
          headline: fontFamily(FontWeight.w600),
          body1: fontFamily(FontWeight.w400),
          title: fontFamily(FontWeight.w700)));
}

TextStyle fontFamily(FontWeight fontWeight) =>
    TextStyle(fontFamily: "Inter", fontWeight: fontWeight);
  