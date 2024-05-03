import 'package:bus_online/models/don_tra.dart';
import 'package:bus_online/services/customer_service.dart';
import 'package:get/get.dart';

class DanhSachVeController extends GetxController {
	final CustomerService customer = CustomerService();
	final listOfDonTra = <DonTra>[].obs; 
	final isLoading = true.obs;

	@override
	void onInit() {
   super.onInit();
		getDonTra();
	}

	Future<void> getDonTra() async {
     final res = await customer.getDonTra();
     if (res != null) {
		   listOfDonTra.value = res;
			 isLoading.value = false;
		}
	}

	Future<void> suDungVe({required int id, required String? maChuyen}) async {
		if(maChuyen == null) return;
		isLoading.value = true;
		await customer.suDungVe(id: id, maChuyen: maChuyen);
		reload();
		Get.offAllNamed('danh-sach-dang-ki');
	}

	Future<void> reload() async {
		isLoading.value = true;
		listOfDonTra.value = [];
    getDonTra();
	}
}
