import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:get/get.dart';

class ChiTietTuyenController extends GetxController {
	final TuyenService tuyenService = TuyenService();
	final isLoading = true.obs; 
  final maTuyen = "".obs;
	final tenTuyen = "".obs;
	final tramList = <Tram>[].obs;
	final chuyenXeList = <ChuyenXe>[].obs;

	String get loTrinh {
		List<String> list = tramList.map((element) => element.tenTram).toList();
    return list.join(" > ");
	}

	@override
	void onInit() {
		super.onInit();
		maTuyen.value = Get.arguments[0];
		tenTuyen.value = Get.arguments[1];
		getTramAndChuyenXe();
	}

  Future<void> getTramAndChuyenXe() async { 
		final res = await Future.wait([
       tuyenService.getChuyenXe(maTuyen.value),
			tuyenService.getTramFromTuyen(maTuyen.value)
		]);
		final chuyenXe = res[0] as List<ChuyenXe>?;
		final tram = res[1] as List<Tram>?;
		if (chuyenXe != null && tram != null) {
			tramList.value = tram;
			chuyenXeList.value = chuyenXe;
			isLoading.value = false;
	  }
	}

}
