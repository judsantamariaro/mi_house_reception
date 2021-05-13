import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Bienvenido @Someone'),
              CircleAvatar(child: Text('S')),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red[700]!,
                  Colors.red[700]!.withOpacity(0.858),
                ],
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
            ),
          ),
        ],
      ),
    );
  }
}
