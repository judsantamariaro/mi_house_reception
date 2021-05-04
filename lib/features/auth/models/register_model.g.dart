// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    documento: json['documento'] as String,
    nombres: json['nombres'] as String,
    apellidos: json['apellidos'] as String,
    nombreConjunto: json['nombreConjunto'] as String?,
    tipoDoc: json['tipoDoc'] as String,
    fechaNac: json['fechaNac'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    repeatPassword: json['repeatPassword'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'tipoDoc': instance.tipoDoc,
      'documento': instance.documento,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'fechaNac': instance.fechaNac,
      'email': instance.email,
      'password': instance.password,
      'repeatPassword': instance.repeatPassword,
      'nombreConjunto': instance.nombreConjunto,
    };
