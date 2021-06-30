import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_house_reception/core/modals/modals.dart';
import 'package:mi_house_reception/core/validators/text_validators.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/residents/models/residents_model.dart';
import 'package:mi_house_reception/features/residents/residents_provider.dart';
import 'package:provider/provider.dart';

class ResidentFormScreen extends StatefulWidget {
  const ResidentFormScreen({Key? key}) : super(key: key);

  static const route = 'ResidentFormScreen';
  @override
  _ResidentFormScreenState createState() => _ResidentFormScreenState();
}

class _ResidentFormScreenState extends State<ResidentFormScreen> {
  final _formController = GlobalKey<FormState>();
  final _documentController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _dateController = TextEditingController();
  final _nombreConjuntoController = TextEditingController();
  final _blockController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? _documentType;
  DateTime? selectedDate;
  final actualDate = DateTime.now();
  bool _isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final authProvider = Provider.of<AuthProvider>(context);
    _nombreConjuntoController.text = authProvider.auth!.conjunto;
    _apartmentController.text = authProvider.auth!.apto;
    _blockController.text = authProvider.auth!.bloque;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(title: const Text('Añadir Residente')),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(top: 20.0, bottom: 31, left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _formController,
                        child: Column(
                          children: [
                            const SizedBox(height: 20.0),
                            DropdownButtonFormField(
                              dropdownColor: const Color(0xffffffff),
                              style: const TextStyle(color: Colors.black),
                              value: _documentType,
                              // style: TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Tipo de documento',
                                const FaIcon(FontAwesomeIcons.addressCard,
                                    textDirection: TextDirection.rtl),
                              ),
                              icon: const Icon(Icons.arrow_downward_rounded, color: Colors.black26),
                              onChanged: (String? newValue) =>
                                  setState(() => _documentType = newValue),
                              items:
                                  <String>['C.C', 'Pasaporte', 'NIT'].map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _documentController,
                              validator: TextValidators.documentValidator,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Numero de Documento',
                                const FaIcon(FontAwesomeIcons.idCard,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _nameController,
                              validator: TextValidators.nameValidator,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Nombres',
                                const FaIcon(FontAwesomeIcons.userAlt,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _lastnameController,
                              validator: TextValidators.nameValidator,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Apellidos',
                                const FaIcon(FontAwesomeIcons.user,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _dateController,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Fecha de Nacimiento',
                                const FaIcon(FontAwesomeIcons.calendarAlt,
                                    textDirection: TextDirection.rtl),
                              ),
                              onTap: () async {
                                DateTime? date;
                                date = await showDatePicker(
                                  context: context,
                                  initialDate: actualDate,
                                  firstDate: DateTime(1900),
                                  lastDate: actualDate,
                                );
                                if (date != null) {
                                  _dateController.text = date.toIso8601String();
                                }
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _nombreConjuntoController,
                              validator: TextValidators.textMandatoryValidator,
                              keyboardType: TextInputType.name,
                              enabled: false,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Nombre del Conjunto',
                                const FaIcon(FontAwesomeIcons.city,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _apartmentController,
                              keyboardType: TextInputType.number,
                              enabled: false,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Apartamento',
                                const FaIcon(FontAwesomeIcons.key,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _blockController,
                              keyboardType: TextInputType.number,
                              enabled: false,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Bloque',
                                const FaIcon(FontAwesomeIcons.solidBuilding,
                                    textDirection: TextDirection.rtl),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _emailController,
                              validator: TextValidators.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Correo',
                                const FaIcon(
                                  FontAwesomeIcons.solidEnvelope,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _passwordController,
                              validator: TextValidators.passwordValidator,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _isObscure,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                prefixIconConstraints:
                                    const BoxConstraints(minWidth: 30, maxHeight: 50),
                                labelText: '  Contraseña',
                                labelStyle: const TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                ),
                                prefixIcon: const FaIcon(
                                  FontAwesomeIcons.lock,
                                  textDirection: TextDirection.rtl,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              // textAlign: TextAlign(2),
                              controller: _repeatPasswordController,
                              validator: TextValidators.passwordValidator,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _isObscure,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                // isDense: true,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),

                                prefixIconConstraints:
                                    const BoxConstraints(minWidth: 30, maxHeight: 50),
                                labelText: '  Confirma tu contraseña',
                                labelStyle: const TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                ),
                                prefixIcon: const FaIcon(
                                  FontAwesomeIcons.lock,
                                  textDirection: TextDirection.rtl,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(100.0),
                            //     ),
                            //     primary: Colors.black26,
                            //   ),
                            //   onPressed: handleOnCreate,
                            //   child: Container(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 60.0, vertical: 13.0),
                            //     child: isLoading
                            //         ? const Center(child: CircularProgressIndicator())
                            //         : const Text(
                            //             'Registrar',
                            //             style: TextStyle(
                            //                 color: Color(0xff0C3C92),
                            //                 fontSize: 18.0,
                            //                 fontWeight: FontWeight.bold),
                            //           ),
                            //   ),
                            // ),
                            SizedBox(
                              width: double.maxFinite,
                              height: 45,
                              child: ElevatedButton(
                                  onPressed: handleOnCreate, child: const Text('Registrar')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration decoration(String labeltextinput, FaIcon iconprefix) {
    return InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 30, maxHeight: 50),
      labelText: labeltextinput,
      labelStyle: const TextStyle(color: Colors.black),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      prefixIcon: iconprefix,
    );
  }

  Future<void> handleOnCreate() async {
    if (_formController.currentState!.validate()) {
      setState(() => isLoading = true);
      final residentsModel = ResidentsModel(
        tipoDoc: _nombreConjuntoController.text.trim(),
        documento: _documentType!,
        nombres: _nameController.text.trim(),
        apellidos: _lastnameController.text.trim(),
        fechaNac: _dateController.text.trim(),
        nombreConjunto: _nombreConjuntoController.text.trim(),
        apto: _apartmentController.text.trim(),
        bloque: _blockController.text.trim(),
        propietario: 'false',
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        repeatPassword: _repeatPasswordController.text.trim(),
      );
      setState(() => isLoading = false);
      final res = await Provider.of<ResidentsProvider>(context, listen: false)
          .registerResident(residentsModel);
      if (res == null) {
        await CustomModals().showWellDone(message: 'Residente registrado');
        Navigator.of(context).pop();
        return;
      }
      await CustomModals().showError(message: res.message);
    }
  }
}
