import 'dart:convert';
import 'package:bus_online/fetch/fetch_base.dart';
import 'package:bus_online/models/don_tra.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../env_key.dart';

class DriverService {
  final FetchBase fetch = FetchBase();

  Future<List<DonTra>?> getDonTra() async {
    try {
      http.Response res = await fetch.get(
          endPoint: ApiEndPoints.driverEndPoints.bangDonTra, auth: true);

      if (res.statusCode != 200) return null;

      final List list = jsonDecode(res.body)['bangDonTra'];
      final List<DonTra> listOfDonTra =
          list.map((e) => DonTra.fromJson(e)).toList();
      return listOfDonTra;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
  }

  Future<void> hoanThanhTram(String maTram) async {
    try {
      Map<String, String> body = {"maTramDen": maTram};
      http.Response res = await fetch.patch(
				endPoint: ApiEndPoints.driverEndPoints.bangDonTra,
				body: body,
				auth: true
			);

      if (res.statusCode != 200) {
        Get.snackbar("Thất bại", "Có lỗi từ hệ thống");
      } else {
        Get.snackbar('Thao tác thành công', "trạm đến đã được hoàn thành");
      }
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
    }
  }
}
