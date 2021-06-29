import 'package:json_annotation/json_annotation.dart';
part 'create_reservation_model.g.dart';

@JsonSerializable()
class CreateReservationModel {
  @JsonKey(name: 'fecha_inicio')
  final DateTime fechaInicio;
  @JsonKey(name: 'fecha_final')
  final DateTime fechaFinal;
  final bool pago;
  final String usuario;
  final String conjunto;
  final String espacio;

  CreateReservationModel({
    required this.fechaInicio,
    required this.fechaFinal,
    required this.pago,
    required this.usuario,
    required this.conjunto,
    required this.espacio,
  });

  factory CreateReservationModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReservationModelToJson(this);
}
