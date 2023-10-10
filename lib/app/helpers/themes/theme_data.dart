import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.poppins().fontFamily,
    listTileTheme: ListTileThemeData(
        tileColor: AppColors.white, textColor: AppColors.darkGray),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.seaGreen),
        titleMedium: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
        titleSmall: TextStyle(fontSize: 16, color: AppColors.lightGray)),
    colorScheme: ColorScheme.light(
        background: AppColors.darkWhite,
        onBackground: AppColors.lightGray,
        primary: AppColors.seaGreen,
        onPrimary: AppColors.lightGray,
        onSurface: AppColors.darkGray,
        tertiary: AppColors.white,
        error: AppColors.red),
    cardColor: AppColors.seaGreen,
    iconTheme: IconThemeData(color: AppColors.darkGray, size: 32),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.seaGreen,
        titleTextStyle: TextStyle(fontSize: 24, color: AppColors.lightGray)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        elevation: MaterialStateProperty.all(5),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.seaGreen,
        iconSize: 36,
        foregroundColor: AppColors.darkWhite));

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.poppins().fontFamily,
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.darkGray,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.seaGreen),
        titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkGray),
        titleSmall: TextStyle(fontSize: 16, color: AppColors.white)),
    colorScheme: ColorScheme.dark(
        background: AppColors.extraDarkGray,
        onBackground: AppColors.white,
        primary: AppColors.seaGreen,
        onPrimary: AppColors.white,
        onSurface: AppColors.white,
        tertiary: AppColors.darkGray,
        error: AppColors.red),
    iconTheme: IconThemeData(color: AppColors.white, size: 32),
    cardColor: AppColors.seaGreen,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkGray,
        foregroundColor: AppColors.seaGreen,
        titleTextStyle: TextStyle(fontSize: 24, color: AppColors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      elevation: MaterialStateProperty.all(5),
    )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.seaGreen,
        iconSize: 36,
        foregroundColor: AppColors.extraDarkGray));
