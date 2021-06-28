// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) {
  return ReservationResponse(
    fechaInicio: json['fecha_inicio'] as String,
    fechaFin: json['fecha_fin'] as String,
    nombreEspacio: json['nombreEspacio'] as String,
    tipoEspacio: json['tipoEspacio'] as String,
    nombreConjunto: json['nombreConjunto'] as String,
    nombreUsuario: json['nombreUsuario'] as String,
    email: json['email'] as String,
    pago: json['pago'] as bool,
  );
}

Map<String, dynamic> _$ReservationResponseToJson(
        ReservationResponse instance) =>
    <String, dynamic>{
      'fecha_inicio': instance.fechaInicio,
      'fecha_fin': instance.fechaFin,
      'nombreEspacio': instance.nombreEspacio,
      'tipoEspacio': instance.tipoEspacio,
      'nombreConjunto': instance.nombreConjunto,
      'nombreUsuario': instance.nombreUsuario,
      'email': instance.email,
      'pago': instance.pago,
    };
