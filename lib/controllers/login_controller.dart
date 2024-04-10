import 'package:bus_online/services/auth_service.dart';
import 'package:bus_online/storage/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final role = 'customer'.obs;
  final passwordVisible = false.obs;

  AuthService auth = AuthService();

  Future<void> login() async {


    final res = await auth.loginWithEmail(
      emailController.text,
      passwordController.text,
      role.value,
    );
    final UserStorage storage = UserStorage();

    if (res != null) {
      emailController.clear();
      passwordController.clear();
			Get.offNamed('/home');
      storage.setUser(token: res['token'], name: res['user']['name'], role: res['user']['role']);
    }
  }

	String? emailValidator(String value) {
		if (GetUtils.isNullOrBlank(value)! || !GetUtils.isEmail(value)) {
		  return "Email định dạng không hợp lệ";
		}
		return null;
	}

	String? passwordValidator(String value) {
		if (GetUtils.isNullOrBlank(value)!) {
		  return "Thông tin không thể để trống";
		}
		return null;
	}
}
