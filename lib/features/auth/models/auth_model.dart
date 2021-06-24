import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String token;
  final String username;
  final String nombres;
  final String apellidos;
  final String conjunto;
  final List<Authorities> authorities;

  AuthModel({
    required this.token,
    required this.username,
    required this.nombres,
    required this.apellidos,
    required this.conjunto,
    required this.authorities,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  @override
  String toString() {
    return 'AuthModel(token: $token, username: $username, nombres: $nombres, apellidos: $apellidos, conjunto: $conjunto, authorities: $authorities)';
  }
}

@JsonSerializable()
class Authorities {
  final String authority;

  Authorities({required this.authority});

  factory Authorities.fromJson(Map<String, dynamic> json) => _$AuthoritiesFromJson(json);

  Map<String, dynamic> toJson() => _$AuthoritiesToJson(this);

  @override
  String toString() => 'Authorities(authority: $authority)';
}
