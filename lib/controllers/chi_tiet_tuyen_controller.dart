import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:get/get.dart';

class ChiTietTuyenController extends GetxController {
	final TuyenService tuyenService = TuyenService();
	var isLoading = true.obs; 
  var maTuyen = "".obs;
	var tenTuyen = "".obs;
	var tramList = <Tram>[].obs;
	var chuyenXeList = <ChuyenXe>[].obs;

	@override
	void onInit() {
		super.onInit();
		maTuyen.value = Get.arguments[0];
		tenTuyen.value = Get.arguments[1];
		getTramAndChuyenXe();
	}

  Future<void> getTramAndChuyenXe() async { 
    final chuyenXe = await tuyenService.getChuyenXe(maTuyen.value);
    final tram = await tuyenService.getTram(maTuyen.value);
		if (chuyenXe != null && tram != null) {
			tramList.value = tram;
			chuyenXeList.value = chuyenXe;
			isLoading.value = false;
	  }
	}

}
