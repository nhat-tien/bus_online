import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../env_key.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail({bool isDriver = false}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var url =
          Uri.parse(ApiEndPoints.baseURL + ApiEndPoints.authEndPoints.login);

      Map<String, String> body = {
        "email": emailController.text,
        "password": passwordController.text,
			  "role": isDriver ? 'driver' : 'customer',
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

			if(response.statusCode == 200) {
			  final json = jsonDecode(response.body);
				if(json['status']) {
				  final token = json['token'];
				}
			}
    } catch (e) {}
  }
}
