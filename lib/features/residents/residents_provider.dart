import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mi_house_reception/core/failure/failure.dart';
import 'package:mi_house_reception/core/requests/http_handler.dart';
import 'package:mi_house_reception/core/token/token.dart';
import 'package:mi_house_reception/features/residents/models/residents_model.dart';

class ResidentsProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;

  ResidentsProvider({required this.httpHandler, required this.token});

  Future<Failure?> registerResident(ResidentsModel residentsModel) async {
    try {
      await httpHandler.performPost(
        'registro/residente',
        residentsModel.toJson(),
        withToken: false,
      );
      notifyListeners();
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un error');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
