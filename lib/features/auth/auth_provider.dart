import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mi_house_reception/core/failure/failure.dart';
import 'package:mi_house_reception/core/requests/http_handler.dart';
import 'package:mi_house_reception/core/token/token.dart';
import 'package:mi_house_reception/features/auth/models/auth_model.dart';
import 'package:mi_house_reception/features/auth/models/login_model.dart';

enum AuthStates { initial, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;
  bool isLoading = false;

  InitialRegisterArgs? initialRegisterArgs;
  AuthModel? auth;

  AuthStates state = AuthStates.notAuthenticated;

  AuthProvider({required this.token, required this.httpHandler});

  void onRegisterArgs(InitialRegisterArgs args) {
    initialRegisterArgs = args;
    notifyListeners();
  }

  Future<Failure?> logout() async {
    state = AuthStates.notAuthenticated;
    notifyListeners();
  }

  Future<Failure?> login(LoginModel login) async {
    try {
      startLoading();
      final res = await httpHandler.performPost('/login', login.toJson(), withToken: false);
      auth = AuthModel.fromJson(res);
      stopLoading();
      token.saveToken(auth!.token);
      state = AuthStates.authenticated;
      notifyListeners();
      return null;
    } on Failure catch (e) {
      stopLoading();
      return e;
    } on SocketException catch (_) {
      stopLoading();
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      stopLoading();
      return Failure(message: e.toString());
    }
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}

class InitialRegisterArgs {
  final String email;
  final String password;
  final String confirmPassword;

  InitialRegisterArgs({required this.email, required this.password, required this.confirmPassword});
}
