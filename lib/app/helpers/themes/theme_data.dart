import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.seaGreen),
      titleMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
      titleSmall: TextStyle(fontSize: 16, color: AppColors.lightGray)),
  colorScheme: ColorScheme.light(
    background: AppColors.white,
    onBackground: AppColors.lightGray,
    primary: AppColors.seaGreen,
    onPrimary: AppColors.white,
  ),
  cardColor: AppColors.seaGreen,
  iconTheme: IconThemeData(color: AppColors.white, size: 32),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white, foregroundColor: AppColors.lightGray),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    elevation: MaterialStateProperty.all(5),
  )),
);

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.seaGreen),
      titleMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.darkGray),
      titleSmall: TextStyle(fontSize: 16, color: AppColors.white)),
  colorScheme: ColorScheme.dark(
    background: AppColors.darkGray,
    onBackground: AppColors.white,
    primary: AppColors.seaGreen,
    onPrimary: AppColors.white,
  ),
  iconTheme: IconThemeData(color: AppColors.darkGray, size: 32),
  cardColor: AppColors.seaGreen,
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGray, foregroundColor: AppColors.white),
  listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(color: AppColors.darkGray, fontSize: 24)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    elevation: MaterialStateProperty.all(5),
  )),
);
