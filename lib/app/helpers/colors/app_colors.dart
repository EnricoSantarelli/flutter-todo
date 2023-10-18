import 'package:flutter/material.dart';

class AppColors {
  static Color seaGreen = const Color(0xFF14B8A6);
  static Color white = const Color(0xFFFFFFFF);
  static Color darkWhite = const Color(0xFFF5F5F5);
  static Color black = const Color(0x00000000);
  static Color lightGray = const Color(0xFF999999);
  static Color darkGray = const Color(0xFF333333);
  static Color extraDarkGray = const Color(0xFF222222);
  static Color green = Colors.lightGreenAccent;
  static Color yellow = Colors.yellowAccent;
  static Color orange = Colors.orangeAccent;
  static Color red = Colors.redAccent;
  static Color purple = Colors.purpleAccent;

  static Color? getColorByDifficulty(int difficulty) {
    Map<int, Color> colorMap = {
      1: AppColors.green,
      2: AppColors.yellow,
      3: AppColors.orange,
      4: AppColors.red,
      5: AppColors.purple
    };

    return colorMap[difficulty];
  }
}
