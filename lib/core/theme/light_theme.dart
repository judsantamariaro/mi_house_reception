import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF4F4F7),
      textTheme: GoogleFonts.openSansTextTheme(),
      primaryColor: const Color(0xFF4369CC),
      accentColor: const Color(0xFFFE6E48),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
    );
  }
}
