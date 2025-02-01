import 'package:flutter/material.dart';

abstract class ComponentThemeTemplate {
  AppBarTheme getAppBarTheme(ColorScheme colorScheme, TextTheme textTheme);
  ElevatedButtonThemeData getElevatedButtonTheme(ColorScheme colorScheme, TextTheme textTheme);
  InputDecorationTheme getInputDecorationTheme(ColorScheme colorScheme, TextTheme textTheme);
  BottomSheetThemeData getBottomSheetTheme(ColorScheme colorScheme, TextTheme textTheme);
}
