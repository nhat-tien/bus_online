import 'dart:convert';
import 'package:bus_online/env_key.dart';
import 'package:bus_online/fetch/fetch_base.dart';
import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/models/tuyen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TuyenService {
  final FetchBase fetch = FetchBase();

  Future<List<Tuyen>?> getAllTuyen() async {
    try {
      http.Response res = await fetch.get(
          endPoint: ApiEndPoints.tuyenEndPoints.tuyen, auth: true);

      if (res.statusCode != 200) return null;

      final List list = jsonDecode(res.body)['data'];
      final List<Tuyen> listOfTuyen =
          list.map((e) => Tuyen.fromJson(e)).toList();
      return listOfTuyen;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
  }

  Future<List<Tram>?> getTramFromTuyen(String? maTuyen) async {
    try {
			if(maTuyen == null) return null;
      http.Response res = await fetch.get(
        endPoint:
            '${ApiEndPoints.tuyenEndPoints.tuyen}/$maTuyen${ApiEndPoints.tramEndPoints.tram}',
				auth: true,
      );
      if (res.statusCode != 200) return null;

      final List list = jsonDecode(res.body)['data']['chiTietTuyen'];
      final List<Tram> listOfTram = list.map((e) => Tram.fromJson(e)).toList();
      return listOfTram;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
  }

  Future<ChuyenXe?> getChuyenXe(String maChuyen) async {
    try {
      http.Response res = await fetch.get(
        endPoint:
            '${ApiEndPoints.chuyenXeEndPoints.chuyenXe}/$maChuyen',
				auth: true
      );
      if (res.statusCode != 200) return null;

      final data = jsonDecode(res.body)['data'];
      final ChuyenXe chuyenXe = ChuyenXe.fromJson(data);
      return chuyenXe;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
	}

  Future<List<ChuyenXe>?> getTatCaChuyenXe(String? maTuyen) async {
    try {
			if(maTuyen == null) return null;
      http.Response res = await fetch.get(
        endPoint:
            '${ApiEndPoints.tuyenEndPoints.tuyen}/$maTuyen${ApiEndPoints.chuyenXeEndPoints.chuyenXe}',
				auth: true
      );
      if (res.statusCode != 200) return null;

      final List list = jsonDecode(res.body)['data']['chuyenXe'];
      final List<ChuyenXe> listOfTram = list.map((e) => ChuyenXe.fromJson(e)).toList();
      return listOfTram;
    } catch (e) {
      Get.snackbar('Lỗi', e.toString());
      return null;
    }
  }
}
