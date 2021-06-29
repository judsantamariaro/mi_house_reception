import 'package:json_annotation/json_annotation.dart';
part 'moving_model.g.dart';

@JsonSerializable()
class MovingModel {
  @JsonKey(name: 'fecha_inicio')
  final DateTime fechaInicio;
  final String usuario;
  final String conjunto;

  MovingModel({
    required this.fechaInicio,
    required this.usuario,
    required this.conjunto,
  });

  factory MovingModel.fromJson(Map<String, dynamic> json) => _$MovingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovingModelToJson(this);
}
