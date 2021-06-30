import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mi_house_reception/core/failure/failure.dart';
import 'package:mi_house_reception/core/modals/modals.dart';
import 'package:mi_house_reception/core/requests/http_handler.dart';
import 'package:mi_house_reception/features/auth/auth_provider.dart';
import 'package:mi_house_reception/features/moving/moving_model.dart';
import 'package:mi_house_reception/features/reservations/models/create_reservation_model.dart';
import 'package:mi_house_reception/features/reservations/models/reservation_model.dart';
import 'package:mi_house_reception/features/reservations/models/reservation_response.dart';
import 'package:mi_house_reception/features/reservations/models/space_reservation_model.dart';
import 'package:mi_house_reception/features/reservations/models/space_reservation_response.dart';
import 'package:provider/provider.dart';

class ReservationProvider extends ChangeNotifier {
  ReservationProvider({required this.httpHandler});
  final HttpHandler httpHandler;
  bool isLoading = false;
  final modals = CustomModals();
  List<ReservationResponse> reservations = [];
  List<SpaceReservationResponse> spaces = [];
  Failure? failure;
  DateTime selectedDate = DateTime.now();
  ReservationResponse? selectedReservation;

  void onSelectedDateChanged(DateTime date) {
    selectedReservation = null;
    selectedDate = date;
    notifyListeners();
  }

  void onSelectedReservation(ReservationResponse reservationResponse) {
    selectedReservation = reservationResponse;
    notifyListeners();
  }

  void cleanSelectedReservation() {
    selectedReservation = null;
    notifyListeners();
  }

  List<ReservationResponse> getReservations(BuildContext context) {
    final username = Provider.of<AuthProvider>(context, listen: false).auth!.username;
    return reservations.where((e) => e.nombreEspacio == 'Mudanza' && e.email == username).toList();
  }

  List<ReservationResponse> getFilteredReservations() {
    return reservations.where((e) => e.nombreEspacio != 'Mudanza').toList();
  }

  Future<void> fetchReservations(ReservationModel reservation) async {
    try {
      selectedReservation = null;
      startLoading();
      final res = await httpHandler.performPost('/reserva/lista-reservas', reservation.toJson());
      reservations = (res['data'] as Iterable)
          .map((e) => ReservationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      stopLoading();
    } on Failure catch (e) {
      failure = e;
      stopLoading();
    } on SocketException catch (_) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    } catch (e) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    }
  }

  Future<void> fetchSpaceReservations(SpaceReservationModel spaceReservationModel) async {
    try {
      startLoading();
      final res = await httpHandler.performPost(
        '/conjunto/listaEspacios',
        spaceReservationModel.toJson(),
      );
      spaces = (res['data'] as Iterable)
          .map((e) => SpaceReservationResponse.fromJson(e as Map<String, dynamic>))
          .where((e) => e.nombre != 'Mudanza')
          .toList();
      stopLoading();
    } on Failure catch (e) {
      failure = e;
      stopLoading();
    } on SocketException catch (_) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    } catch (e) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    }
  }

  Future<Failure?> createReservation(CreateReservationModel createReservationModel) async {
    try {
      startLoading();
      await httpHandler.performPost('/reserva/nueva', createReservationModel.toJson());
      stopLoading();
    } on Failure catch (e) {
      failure = e;
      stopLoading();
    } on SocketException catch (_) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    } catch (e) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    }
  }

  Future<Failure?> createMoving(MovingModel movingModel) async {
    try {
      startLoading();
      await httpHandler.performPost('/reserva/mudanza', movingModel.toJson());
      stopLoading();
    } on Failure catch (e) {
      failure = e;
      stopLoading();
    } on SocketException catch (_) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    } catch (e) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    }
  }

  Future<Failure?> deleteMoving(ReservationResponse reservationResponse) async {
    final movingModel = MovingModel(
      conjunto: reservationResponse.nombreConjunto,
      usuario: reservationResponse.email,
      fechaInicio: DateTime.parse(reservationResponse.fechaInicio),
    );
    try {
      startLoading();
      await httpHandler.performDelete('/reserva/mudanza/eliminar', movingModel.toJson());
      reservations.removeWhere((e) => e == reservationResponse);
      stopLoading();
    } on Failure catch (e) {
      failure = e;
      stopLoading();
    } on SocketException catch (_) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    } catch (e) {
      failure = Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
      stopLoading();
    }
  }

  void startLoading() {
    isLoading = true;
    failure = null;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}

class ReservationUtils {
  static String getFormattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
