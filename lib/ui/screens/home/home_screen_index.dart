import 'package:flutter/material.dart';
import 'package:mi_house_reception/ui/screens/home/home_reports_tab.dart';
import 'package:mi_house_reception/ui/screens/home/home_tab.dart';
import 'package:mi_house_reception/ui/screens/home/profile_tab.dart';
import 'package:mi_house_reception/ui/screens/reservations/reservations_calendar.dart';

class HomeScreenIndex extends StatefulWidget {
  const HomeScreenIndex({Key? key}) : super(key: key);

  @override
  _HomeScreenIndexState createState() => _HomeScreenIndexState();
}

class _HomeScreenIndexState extends State<HomeScreenIndex> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 0.5)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: updateHomeIndex,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.4),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Reservas'),
              BottomNavigationBarItem(icon: Icon(Icons.face_sharp), label: 'Perfil'),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: IndexedStack(
        index: index,
        children: [
          HomeTab(),
          const ReservationsTab(),
          ProfileTab(),
        ],
      ),
    );
  }

  void updateHomeIndex(int val) {
    if (val == 1) {
      Navigator.of(context).pushNamed(ReservationsCalendar.route);
      return;
    }
    setState(() {
      index = val;
    });
  }
}
