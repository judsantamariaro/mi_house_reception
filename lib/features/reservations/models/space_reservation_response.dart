import 'package:json_annotation/json_annotation.dart';
part 'space_reservation_response.g.dart';

@JsonSerializable()
class SpaceReservationResponse {
  final String nombre;
  final String precio;
  final String aforo;
  final String tipo;
  final String conjunto;

  SpaceReservationResponse({
    required this.nombre,
    required this.precio,
    required this.aforo,
    required this.tipo,
    required this.conjunto,
  });

  factory SpaceReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$SpaceReservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceReservationResponseToJson(this);
}
