import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/modals/modals.dart';
import 'package:mi_house_reception/core/validators/text_validators.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/auth/models/login_model.dart';
import 'package:mi_house_reception/widgets/background/background_image.dart';
import 'package:mi_house_reception/widgets/buttons/social_network_icon_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formController = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '¡Hola!',
                style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 15),
              const Text(
                'Inicia sesion en mi house recepción',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 15),
              const SocialNetworkIcons(mainAxisAlignment: MainAxisAlignment.start, height: 150),
              const SizedBox(height: 20),
              Form(
                key: _formController,
                child: Column(
                  children: [
                    TextFormField(
                      validator: TextValidators.emailValidator,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
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
                    TextFormField(
                      validator: TextValidators.passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.white70),
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: Provider.of<AuthProvider>(context).isLoading
                      ? () {}
                      : () => handleOnLogin(context),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                  child: Provider.of<AuthProvider>(context).isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Iniciar sesion'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Al iniciar sesion aceptas nuestra politica de privacidad',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handleOnLogin(BuildContext context) async {
    if (!_formController.currentState!.validate()) {
      return;
    }
    final res = await Provider.of<AuthProvider>(context, listen: false).login(
      LoginModel(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
    if (res != null) {
      CustomModals().showError(message: res.message);
    }
  }
}
