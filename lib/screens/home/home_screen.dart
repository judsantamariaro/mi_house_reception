import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onTap: (val) => setState(() => index = val),
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white.withOpacity(0.4),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Reportes'),
              BottomNavigationBarItem(icon: Icon(Icons.face_sharp), label: 'Perfil'),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: index,
        children: const [
          Center(child: Text('0')),
          Center(child: Text('1')),
          Center(child: Text('2')),
        ],
      ),
    );
  }
}
