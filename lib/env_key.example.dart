class SupabaseKey {
  static const String url = '';
  static const String apiKey = '';
}

class ApiEndPoints {
  static const String baseURL = '';
  static AuthEndPoints authEndPoints = AuthEndPoints();
	static UserEndPoints userEndPoints = UserEndPoints();
	static TuyenEndPoints tuyenEndPoints = TuyenEndPoints();
	static TramEndPoints tramEndPoints = TramEndPoints();
	static ChuyenXeEndPoints chuyenXeEndPoints = ChuyenXeEndPoints();
	static CustomerEndPoints customerEndPoints = CustomerEndPoints();
	static DriverEndPoints driverEndPoints = DriverEndPoints();
}

class AuthEndPoints {
  final String login = '';
  final String register = '';
  final String logout = '';
}

class UserEndPoints {
	final String information = "";
}

class TuyenEndPoints {
  final String tuyen = '';
}

class TramEndPoints {
  final String tram = '';
}

class ChuyenXeEndPoints {
   final String chuyenXe = '';
}

class CustomerEndPoints {
	final String base = '';

	String get bangDonTra => '$base/';
}

class DriverEndPoints {
	final String base = '';

	String get bangDonTra => '$base/';
}
