import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get fw900 => copyWith(fontWeight: FontWeight.w900, letterSpacing: 0);
  TextStyle get fw800 => copyWith(fontWeight: FontWeight.w800, letterSpacing: 0);
  TextStyle get fw700 => copyWith(fontWeight: FontWeight.w700, letterSpacing: 0);
  TextStyle get fw600 => copyWith(fontWeight: FontWeight.w600, letterSpacing: 0);
  TextStyle get fw500 => copyWith(fontWeight: FontWeight.w500, letterSpacing: 0);
  TextStyle get fw400 => copyWith(fontWeight: FontWeight.w400, letterSpacing: 0);
  TextStyle get fw300 => copyWith(fontWeight: FontWeight.w300, letterSpacing: 0);
  TextStyle get fw200 => copyWith(fontWeight: FontWeight.w200, letterSpacing: 0);
  TextStyle get fw100 => copyWith(fontWeight: FontWeight.w100, letterSpacing: 0);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic, letterSpacing: 0);
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline, letterSpacing: 0);

  TextStyle withColor(Color color) => copyWith(color: color, letterSpacing: 0);
  TextStyle withSize(double size) => copyWith(fontSize: size, letterSpacing: 0);
}


