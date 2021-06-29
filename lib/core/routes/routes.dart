import 'package:flutter/material.dart';
import 'package:mi_house_reception/ui/screens/auth/index_screen.dart';
import 'package:mi_house_reception/ui/screens/moving/moving_calendar.dart';
import 'package:mi_house_reception/ui/screens/moving/moving_form.dart';
import 'package:mi_house_reception/ui/screens/reservations/reservation_form.dart';
import 'package:mi_house_reception/ui/screens/reservations/reservations_calendar.dart';

Map<String, Widget Function(BuildContext)> routes = {
  IndexScreen.route: (ctx) => const IndexScreen(),
  MovingCalendarScreen.route: (ctx) => const MovingCalendarScreen(),
  MovingFormScreen.route: (ctx) => const MovingFormScreen(),
  ReservationFormScreen.route: (ctx) => const ReservationFormScreen(),
  ReservationsCalendar.route: (ctx) => const ReservationsCalendar(),
};
