import 'package:bus_online/pages/login.dart';
import 'package:bus_online/utils/user_storage.dart';
import 'package:flutter/material.dart';
import '../env_key.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class AuthService {

      final UserStorage _storage = UserStorage();

  Future loginWithEmail(String email, String password, String role) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var url =
          Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.authEndPoints.login);

      Map<String, String> body = {
        "email": email,
        "password": password,
        "role": role,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status']) {
          final token = json['token'];

					Get.snackbar('Xác thực', 'Đăng nhập thành công');
          return {
            'status': true,
            'token': token,
          };
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
			Get.snackbar('Xác thực', 'Đăng nhập thất bại');
    }
  }

	Future registerWithEmail(String name, String email, String password) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var url =
          Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.authEndPoints.register);

      Map<String, String> body = {
			  "name" : name,
        "email": email,
        "password": password,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status']) {
          final token = json['token'];

					Get.snackbar('Xác thực', 'Đăng kí thành công');
          return {
            'status': true,
            'token': token,
          };
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
					Get.snackbar('Xác thực', 'Đăng kí thất bại');
    }
	}

	Future logout() async {
    try {

      
			final String? token = _storage.getToken();

      Map<String, String> headers = {
				'Content-Type': 'application/json',
			  'Authorization' : 'Bearer $token',
			};

      var url =
          Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.authEndPoints.logout);

      http.Response response =
          await http.post(url, body: jsonEncode({}), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status']) {
				   _storage.removeUser();
				   Get.offAll(LoginPage());
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(10),
              children: [Text(e.toString())],
            );
          });
    }
	}
  

	bool isLogin() {
	  final String? token = _storage.getToken(); 	
		return token != null;
	}

}
