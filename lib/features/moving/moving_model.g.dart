// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moving_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovingModel _$MovingModelFromJson(Map<String, dynamic> json) {
  return MovingModel(
    fechaInicio: DateTime.parse(json['fecha_inicio'] as String),
    usuario: json['usuario'] as String,
    conjunto: json['conjunto'] as String,
  );
}

Map<String, dynamic> _$MovingModelToJson(MovingModel instance) =>
    <String, dynamic>{
      'fecha_inicio': instance.fechaInicio.toIso8601String(),
      'usuario': instance.usuario,
      'conjunto': instance.conjunto,
    };
