import 'package:flutter/material.dart';
import 'package:mi_house_reception/ui/screens/auth/index_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  IndexScreen.route: (ctx) => const IndexScreen(),
};
