import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Color(0xFF808080),
      primary: Colors.white,
      onPrimary: Color(0xFF14B8A6),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, foregroundColor: Color(0xFF808080)),
    textTheme: GoogleFonts.poppinsTextTheme());

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      onBackground: Colors.white,
      primary: Color(0xFF14B8A6),
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black, foregroundColor: Colors.white),
    textTheme: GoogleFonts.poppinsTextTheme());
