import 'dart:convert';
import 'package:bus_online/storage/user_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bus_online/env_key.dart';

class FetchBase {
  static const baseHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static const baseURL = ApiEndPoints.baseURL;

  final UserStorage _storage = UserStorage();

  Future<http.Response> get(
      {required String endPoint, bool auth = false, Map<String, String>? queryParams}) async {

    var url = Uri.parse(baseURL + endPoint);

    final Map<String, String> newHeaders = Map.from(baseHeaders);
    if (auth) {
      newHeaders['Authorization'] = 'Bearer ${_storage.getToken()}';
    }
    return http.get(url, headers: newHeaders);
  }

  Future<http.Response> post(
      {required String endPoint,
      Map<String, dynamic>? body,
      bool auth = false}) async {
    final url = Uri.parse(baseURL + endPoint);
    final bodyReq = body != null ? jsonEncode(body) : jsonEncode({});
    final Map<String, String> newHeaders = Map.from(baseHeaders);
    if (auth) {
      newHeaders['Authorization'] = 'Bearer ${_storage.getToken()}';
    }
    return http.post(url, body: bodyReq, headers: newHeaders);
  }

  Future<http.Response> patch(
      {required String endPoint,
      Map<String, dynamic>? body,
      bool auth = false}) async {
    final url = Uri.parse(baseURL + endPoint);
    final bodyReq = body != null ? jsonEncode(body) : jsonEncode({});
    final Map<String, String> newHeaders = Map.from(baseHeaders);
    if (auth) {
      newHeaders['Authorization'] = 'Bearer ${_storage.getToken()}';
    }
    return http.patch(url, body: bodyReq, headers: newHeaders);
  }
}
