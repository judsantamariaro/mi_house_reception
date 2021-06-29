import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/validators/text_validators.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/reservations/models/space_reservation_model.dart';
import 'package:mi_house_reception/features/reservations/models/space_reservation_response.dart';
import 'package:mi_house_reception/features/reservations/reservation_provider.dart';
import 'package:provider/provider.dart';

class ReservationFormScreen extends StatefulWidget {
  const ReservationFormScreen({Key? key}) : super(key: key);

  static const route = 'ReservationFormScreen';

  @override
  _ReservationFormScreenState createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  final _emailController = TextEditingController();
  final _conjuntoController = TextEditingController();
  final _initialDateController = TextEditingController();
  final _lastDateController = TextEditingController();
  final _formController = GlobalKey<FormState>();
  bool isPaid = false;
  SpaceReservationResponse? selectedSpace;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      final authProv = Provider.of<AuthProvider>(context, listen: false).auth;
      final resProv = Provider.of<ReservationProvider>(context, listen: false);
      resProv.fetchSpaceReservations(SpaceReservationModel(nombreConjunto: authProv!.conjunto));
      final selectedDate = resProv.selectedDate;
      _emailController.value = TextEditingValue(text: authProv.username);
      _conjuntoController.value = TextEditingValue(text: authProv.conjunto);
      _initialDateController.value =
          TextEditingValue(text: ReservationUtils.getFormattedDate(selectedDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    final resProv = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Crear reserva')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: _formController,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Llena los datos para realizar la reserva:',
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
              TextFormField(
                controller: _lastDateController,
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final date = await showDatePicker(
                    context: context,
                    initialDate: resProv.selectedDate,
                    firstDate: resProv.selectedDate,
                    lastDate: DateTime.now().add(const Duration(days: 8)),
                  );
                  if (date != null) {
                    _lastDateController.value = TextEditingValue(
                      text: ReservationUtils.getFormattedDate(date),
                    );
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  labelText: 'Fecha final',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1.8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              resProv.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DropdownButtonFormField<String>(
                      onChanged: (i) => setState(
                          () => selectedSpace = resProv.spaces.firstWhere((e) => e.nombre == i)),
                      validator: TextValidators.textMandatoryValidator,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.place),
                        labelText: 'Espacio',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1.8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 1.8),
                        ),
                      ),
                      items: resProv.spaces
                          .map((e) => DropdownMenuItem(
                                value: e.nombre,
                                child: Text(e.nombre),
                              ))
                          .toList(),
                    ),
              const SizedBox(height: 15),
              if (selectedSpace != null) ...[
                Text('Nombre: ${selectedSpace!.nombre}'),
                Text('Precio: ${selectedSpace!.precio}'),
                Text('Aforo: ${selectedSpace!.aforo}'),
                Text('Tipo: ${selectedSpace!.tipo}'),
                Text('Conjunto: ${selectedSpace!.conjunto}'),
                const SizedBox(height: 15),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('¿Esta pago?'),
                  Switch.adaptive(value: isPaid, onChanged: (v) => setState(() => isPaid = v)),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                height: 45,
                child: ElevatedButton(onPressed: () {}, child: const Text('Reservar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}