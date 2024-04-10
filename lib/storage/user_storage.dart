import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage {
  final GetStorage _storage = GetStorage();

  void setUser(
      {required String token, required String name, required String role}) {
    try {
      _storage.write('userToken', token);
      _storage.write('userName', name);
      _storage.write('userRole', role);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Map<String, String>? getUser() {
    try {
      var user = <String, String>{};
      user['userToken'] = _storage.read('userToken');
      user['userName'] = _storage.read('userName');
      user['userRole'] = _storage.read('userRole');
      return user;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return null;
    }
  }
	String getName() {
		var name = _storage.read('userName');
		return name ?? "";
	}

	String getRole() {
		var name = _storage.read('userRole');
		return name ?? "";
	}

	String getToken() {
		var name = _storage.read('userToken');
		return name ?? "";
	}


  void removeUser() {
    try {
      _storage.remove('userName');
      _storage.remove('userToken');
      _storage.remove('userRole');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
