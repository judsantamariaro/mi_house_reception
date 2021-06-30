import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/modals/modals.dart';
import 'package:mi_house_reception/core/validators/text_validators.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/moving/moving_model.dart';
import 'package:mi_house_reception/features/reservations/reservation_provider.dart';
import 'package:mi_house_reception/ui/screens/auth/index_screen.dart';
import 'package:provider/provider.dart';

class MovingFormScreen extends StatefulWidget {
  const MovingFormScreen({Key? key}) : super(key: key);

  static const route = 'MovingFormScreen';

  @override
  _MovingFormScreenState createState() => _MovingFormScreenState();
}

class _MovingFormScreenState extends State<MovingFormScreen> {
  final _emailController = TextEditingController();
  final _conjuntoController = TextEditingController();
  final _initialDateController = TextEditingController();
  final _formController = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      final authProv = Provider.of<AuthProvider>(context, listen: false).auth;
      final resProv = Provider.of<ReservationProvider>(context, listen: false);
      final selectedDate = resProv.selectedDate;
      _emailController.value = TextEditingValue(text: authProv!.username);
      _conjuntoController.value = TextEditingValue(text: authProv.conjunto);
      _initialDateController.value =
          TextEditingValue(text: ReservationUtils.getFormattedDate(selectedDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    final resProv = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Programar mudanza')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: _formController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Revisa los datos antes de programar la mudanza:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: TextValidators.emailValidator,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                enabled: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Correo electronico',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _conjuntoController,
                enabled: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.home),
                  labelText: 'Conjunto',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _initialDateController,
                enabled: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  labelText: 'Fecha de inicio',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                height: 45,
                child: ElevatedButton(
                  onPressed: resProv.isLoading ? () {} : handleOnReserve,
                  child: resProv.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const Text('Confirmar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handleOnReserve() async {
    if (!_formController.currentState!.validate()) {
      return;
    }
    final res = await Provider.of<ReservationProvider>(context, listen: false).createMoving(
      MovingModel(
        fechaInicio: DateTime.parse(_initialDateController.text).add(const Duration(hours: 10)),
        usuario: _emailController.text.trim(),
        conjunto: _conjuntoController.text.trim(),
      ),
    );
    if (res == null) {
      await CustomModals().showWellDone(message: 'Mudanza programada con exito');
      await Future.delayed(const Duration(milliseconds: 100));
      Navigator.of(context).popUntil(ModalRoute.withName(IndexScreen.route));
    } else {
      await CustomModals().showError(message: res.message);
    }
  }
}
