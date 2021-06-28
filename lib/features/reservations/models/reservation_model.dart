import 'package:json_annotation/json_annotation.dart';
part 'reservation_model.g.dart';

@JsonSerializable()
class ReservationModel {
  @JsonKey(name: 'fecha_inicial')
  final String fechaInicial;
  final String nombreConjunto;

  ReservationModel({required this.fechaInicial, required this.nombreConjunto});

  factory ReservationModel.fromJson(Map<String, dynamic> json) => _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}
