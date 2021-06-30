// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return AuthModel(
    token: json['token'] as String,
    username: json['username'] as String,
    nombres: json['nombres'] as String,
    apellidos: json['apellidos'] as String,
    conjunto: json['conjunto'] as String,
    apto: json['apto'] as String,
    bloque: json['bloque'] as String,
    authorities: (json['authorities'] as List<dynamic>)
        .map((e) => Authorities.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'conjunto': instance.conjunto,
      'apto': instance.apto,
      'bloque': instance.bloque,
      'authorities': instance.authorities,
    };

Authorities _$AuthoritiesFromJson(Map<String, dynamic> json) {
  return Authorities(
    authority: json['authority'] as String,
  );
}

Map<String, dynamic> _$AuthoritiesToJson(Authorities instance) =>
    <String, dynamic>{
      'authority': instance.authority,
    };
