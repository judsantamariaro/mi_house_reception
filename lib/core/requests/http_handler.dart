import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mi_house_administrator/core/constants/api_constants.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/token/token.dart';

abstract class HttpHandler {
  Future<Map<String, dynamic>> performGet(
    String endpoint, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performPost(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performPut(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performDelete(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });
}

class HttpHandlerImpl implements HttpHandler {
  final Token token;

  HttpHandlerImpl({required this.token});

  @override
  Future<Map<String, dynamic>> performGet(
    String endpoint, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
      );
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      if (isFailed(res.statusCode) || decodedRes['status'] == 'BAD') {
        throw Failure(
          message: (decodedRes['message'] as String?) ?? 'Ha ocurrido un error, intenta mas tarde',
        );
      }
      printLogs(response: res.body, type: 'GET', endpoint: endpoint, statusCode: res.statusCode);
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performDelete(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.delete(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      printLogs(
          response: res.body,
          type: 'DELETE',
          endpoint: endpoint,
          statusCode: res.statusCode,
          body: body.toString());
      if (isFailed(res.statusCode) || decodedRes['status'] == 'BAD') {
        throw Failure(message: decodedRes['message'] as String);
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performPost(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      printLogs(
          response: res.body,
          type: 'POST',
          endpoint: endpoint,
          statusCode: res.statusCode,
          body: body.toString());
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      if (isFailed(res.statusCode) || decodedRes['status'] == 'BAD') {
        throw Failure(
          message: (decodedRes['message'] as String?) ?? 'Ha ocurrido un error, intenta mas tarde',
        );
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performPut(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.put(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      printLogs(
          response: res.body,
          type: 'PUT',
          endpoint: endpoint,
          statusCode: res.statusCode,
          body: body.toString());
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;

      if (isFailed(res.statusCode) || decodedRes['status'] == 'BAD') {
        throw Failure(
          message: (decodedRes['message'] as String?) ?? 'Ha ocurrido un error, intenta mas tarde',
        );
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  bool isFailed(int statusCode) => statusCode < 200 || statusCode >= 300;

  Map<String, String> getHeaders({required bool withToken}) {
    final headersBase = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": 'true',
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, HEAD, POST, PUT, DELETE, OPTIONS",
    };
    if (withToken) {
      if (token.token == null) {
        throw Failure(message: 'El usuario no tiene un Token');
      }
      headersBase['Authorization'] = 'Bearer ${token.token!}';
    }
    return headersBase;
  }

  void printLogs({
    required int statusCode,
    required String response,
    required String endpoint,
    required String type,
    String? body,
  }) {
    log('#########################################################');
    log('API RESPONSE');
    log('#########################################################');
    log('Type: $type');
    log('Token: ${token.token ?? "NO TOKEN"}');
    log('For: $endpoint');
    log('Statuscode: $statusCode');
    log('Body: $body');
    log('Response: $response');
    log('#########################################################');
  }
}
