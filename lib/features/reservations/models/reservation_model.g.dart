// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) {
  return ReservationModel(
    fechaInicial: json['fecha_inicial'] as String,
    nombreConjunto: json['nombreConjunto'] as String,
  );
}

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'fecha_inicial': instance.fechaInicial,
      'nombreConjunto': instance.nombreConjunto,
    };
