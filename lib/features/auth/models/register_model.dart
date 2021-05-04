import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String tipoDoc;
  final String documento;
  final String nombres;
  final String apellidos;
  final String fechaNac;
  final String email;
  final String password;
  final String repeatPassword;
  final String? nombreConjunto;

  RegisterModel({
    required this.documento,
    required this.nombres,
    required this.apellidos,
    this.nombreConjunto,
    required this.tipoDoc,
    required this.fechaNac,
    required this.email,
    required this.password,
    required this.repeatPassword,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
