import 'package:flutter/material.dart';
import 'package:mi_house_administrator/screens/auth/index_screen.dart';
import 'package:mi_house_administrator/screens/auth/login_screen.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';
import 'package:mi_house_administrator/screens/home/home_screen.dart';
import 'package:mi_house_administrator/screens/recepcion/recepcion_form.dart';
import 'package:mi_house_administrator/screens/residents/residents_form.dart';

Map<String, Widget Function(BuildContext)> routes = {
  IndexScreen.route: (ctx) => const IndexScreen(),
  LoginScreen.route: (ctx) => const LoginScreen(),
  RegisterScreen.route: (ctx) => const RegisterScreen(),
  HomeScreen.route: (ctx) => const HomeScreen(),
  ResidentsFormScreen.route: (ctx) => const ResidentsFormScreen(),
  RecepcionFormScreen.route: (ctx) => const RecepcionFormScreen(),
};
