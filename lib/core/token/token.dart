import 'package:mi_house_administrator/core/db/database.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';

class Token {
  String? token;
  final Database dbClient;

  Token({required this.dbClient, this.token});

  Future<String?> getToken() async {
    if (token == null) {
      final _token = await dbClient.getObject(key: 'token');
      if (_token == null) {
        throw Failure(message: 'El usuario no tiene un Token');
      }
      token = _token as String?;
    }
    return token;
  }

  Future<void> saveToken(String token) async {
    this.token = token;
    await dbClient.saveObject(value: 'token', key: token);
  }

  Future<void> updateToken(String token) async {
    await dbClient.saveObject(value: 'token', key: token);
    this.token = token;
  }

  Future<void> deleteToken() async {
    token = null;
    await dbClient.deleteObject(key: 'token');
  }
}
