// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceReservationResponse _$SpaceReservationResponseFromJson(
    Map<String, dynamic> json) {
  return SpaceReservationResponse(
    nombre: json['nombre'] as String,
    precio: json['precio'] as String,
    aforo: json['aforo'] as String,
    tipo: json['tipo'] as String,
    conjunto: json['conjunto'] as String,
  );
}

Map<String, dynamic> _$SpaceReservationResponseToJson(
        SpaceReservationResponse instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'precio': instance.precio,
      'aforo': instance.aforo,
      'tipo': instance.tipo,
      'conjunto': instance.conjunto,
    };
