import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String token;
  final String username;
  final String nombres;
  final String apellidos;
  final Conjunto conjunto;
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
class Conjunto {
  final int id;
  final String nombre;
  final String? direccion;

  Conjunto({required this.id, required this.nombre, this.direccion});
  factory Conjunto.fromJson(Map<String, dynamic> json) => _$ConjuntoFromJson(json);

  Map<String, dynamic> toJson() => _$ConjuntoToJson(this);

  @override
  String toString() => 'Conjunto(id: $id, nombre: $nombre, direccion: $direccion)';
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
