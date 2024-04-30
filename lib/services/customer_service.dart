import 'dart:convert';

import 'package:bus_online/fetch/fetch_base.dart';
import 'package:bus_online/models/don_tra.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:bus_online/env_key.dart';

class CustomerService {
  final FetchBase fetch = FetchBase();

  Future<List<DonTra>?> getDonTra() async {
    try {
      http.Response res = await fetch.get(
          endPoint: ApiEndPoints.customerEndPoints.bangDonTra, auth: true);

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

  Future<bool> postDonTra(
      {required String maTramDi,
      required String maTramDen,
      required String maTuyen,
      required String maChuyen,
	    required int soLuong }) async {
    try {
      final body = {
        "maTramDi": maTramDi,
        "maTramDen": maTramDen,
        "maTuyen": maTuyen,
        "maChuyen": maChuyen,
        "soLuong": soLuong,
      };
      http.Response res = await fetch.post(
          endPoint: ApiEndPoints.customerEndPoints.bangDonTra,
          body: body,
          auth: true);

      if (res.statusCode != 200) return false;
      final json = jsonDecode(res.body);
      if (json['status']) {
        Get.snackbar('Thành công', json['message']);
      }
      return json['status'];
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return false;
    }
  }

  //TODO: 
	// Future tinhTien() {
	//
	// }
}
