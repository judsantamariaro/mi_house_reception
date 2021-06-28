import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/validators/text_validators.dart';

class ReservationFormScreen extends StatelessWidget {
  ReservationFormScreen({Key? key}) : super(key: key);

  static const route = 'ReservationFormScreen';

  final _emailController = TextEditingController();
  final _conjuntoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear reserva')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Llena los datos para realizar la reserva'),
            TextFormField(
              validator: TextValidators.emailValidator,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white70),
                labelText: 'Correo electronico',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
