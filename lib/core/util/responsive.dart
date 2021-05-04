import 'package:flutter/material.dart';

class Responsive {
  static double homeWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    return isLarge ? size.width - 270 : size.width - 170;
  }

  static bool isLarge(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > 1024;
  }
}
