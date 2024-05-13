import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage {
  final GetStorage _storage = GetStorage();

  void setUser(
      {required String token, required String name, required String role, String? maChuyen }) {
    try {
      _storage.write('userToken', token);
      _storage.write('userName', name);
      _storage.write('userRole', role);
			if(maChuyen == null) return;
			_storage.write('maChuyen', maChuyen);
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
			if(user['userRole'] != "driver") return user;
			user['maChuyen'] = _storage.read('maChuyen');
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
		var role = _storage.read('userRole');
		return role ?? "";
	}

	String getToken() {
		var token = _storage.read('userToken');
		return token ?? "";
	}

	String getMaChuyen() {
		var maChuyen = _storage.read('maChuyen');
		return maChuyen ?? "";
	}


  void removeUser() {
    try {
      _storage.remove('userName');
      _storage.remove('userToken');
      _storage.remove('userRole');
      _storage.remove('maChuyen');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
