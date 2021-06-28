import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF4F4F7),
      textTheme: GoogleFonts.poppinsTextTheme(),
      primaryColor: const Color(0xFF4369CC),
      accentColor: const Color(0xFFDA603E),
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF4369CC),
      ),
    );
  }
}
