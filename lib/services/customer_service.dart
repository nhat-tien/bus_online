import 'dart:convert';
import 'package:bus_online/fetch/fetch_base.dart';
import 'package:bus_online/models/don_tra.dart';
import 'package:bus_online/utils/parse_query_string.dart';
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

  Future<bool> postDonTra({
    required String maTramDi,
    required String maTramDen,
    required String maTuyen,
    required String maChuyen,
    required int soLuong,
    required String chieu,
  }) async {
    try {
      final body = {
        "maTramDi": maTramDi,
        "maTramDen": maTramDen,
        "maTuyen": maTuyen,
        "maChuyen": maChuyen,
        "soLuong": soLuong,
        "chieu": chieu
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

  Future<String?> tinhTien(
      {required String? maTramDi,
      required String? maTramDen,
      required String? maTuyen,
      required int soLuong}) async {
    try {
      Map<String, String?> queryParams = {
        "maTramDen": maTramDen,
        "maTramDi": maTramDi,
        "maTuyen": maTuyen,
        "soLuong": soLuong.toString(),
      };
      final String queryString = parseQueryString(queryParams);
      http.Response res = await fetch.get(
          endPoint:
              '${ApiEndPoints.customerEndPoints.bangDonTra}/tinh-tien$queryString',
          auth: true);

      if (res.statusCode != 200) return null;
      final json = jsonDecode(res.body);
      return json['tienPhi'].toString();
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
  }

  Future<void> suDungVe({required int id, required String maChuyen}) async {
    try {
      Map<String, dynamic> body = {
        "id": id,
        "maChuyen": maChuyen,
      };
      http.Response res = await fetch.patch(
          endPoint:
              ApiEndPoints.customerEndPoints.bangDonTra,
				  body: body,
          auth: true);

			final json = jsonDecode(res.body);
      if (res.statusCode != 200) {
        Get.snackbar("Lỗi",json['message']);
				return;
			}
			Get.snackbar("Thành công",json['message']);
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
    }
  }
}
