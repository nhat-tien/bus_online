import 'package:bus_online/models/tuyen.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:get/get.dart';

class TuyenController extends GetxController {
	final TuyenService tuyenService = TuyenService();
  var tuyenList = <Tuyen>[].obs;
	var isLoading = true.obs;

	@override
	void onInit() {
		super.onInit();
		getTuyen();
	}

	Future<void> getTuyen() async {
    final tuyen = await tuyenService.getAllTuyen();
		if (tuyen != null) {
    tuyenList.value = tuyen;
		isLoading.value = false;
		}
	}
  
}
