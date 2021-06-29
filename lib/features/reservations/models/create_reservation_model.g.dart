// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationModel _$CreateReservationModelFromJson(
    Map<String, dynamic> json) {
  return CreateReservationModel(
    fechaInicio: DateTime.parse(json['fecha_inicio'] as String),
    fechaFinal: DateTime.parse(json['fecha_final'] as String),
    pago: json['pago'] as bool,
    usuario: json['usuario'] as String,
    conjunto: json['conjunto'] as String,
    espacio: json['espacio'] as String,
  );
}

Map<String, dynamic> _$CreateReservationModelToJson(
        CreateReservationModel instance) =>
    <String, dynamic>{
      'fecha_inicio': instance.fechaInicio.toIso8601String(),
      'fecha_final': instance.fechaFinal.toIso8601String(),
      'pago': instance.pago,
      'usuario': instance.usuario,
      'conjunto': instance.conjunto,
      'espacio': instance.espacio,
    };
