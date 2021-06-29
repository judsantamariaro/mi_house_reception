import 'package:json_annotation/json_annotation.dart';
part 'reservation_response.g.dart';

@JsonSerializable()
class ReservationResponse {
  @JsonKey(name: 'fecha_inicio')
  final String fechaInicio;
  @JsonKey(name: 'fecha_fin')
  final String? fechaFin;
  final String nombreEspacio;
  final String tipoEspacio;
  final String nombreConjunto;
  final String nombreUsuario;
  final String email;
  final bool pago;

  ReservationResponse({
    required this.fechaInicio,
    required this.fechaFin,
    required this.nombreEspacio,
    required this.tipoEspacio,
    required this.nombreConjunto,
    required this.nombreUsuario,
    required this.email,
    required this.pago,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationResponseToJson(this);
}
