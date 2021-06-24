import 'package:flutter/material.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido ${authProvider.auth!.nombres}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Conjunto: ${authProvider.auth!.conjunto}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).accentColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.5,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
            ],
          ),
          alignment: Alignment.center,
          child: const Text(
            'S',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
