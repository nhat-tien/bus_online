import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/services/driver_service.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bus_online/storage/user_storage.dart';
import 'package:get/get.dart';

class LichTrinhController extends GetxController {
	final TuyenService tuyenService = TuyenService();
	final DriverService driverService = DriverService();
	final UserStorage userStorage = UserStorage();
	final isLoading = true.obs;
	final tramList = <Tram>[].obs;
	final chuyenXe = Rx<ChuyenXe?>(null);

	@override
  void onInit() {
    super.onInit();
		fetchTramListAndChuyen();
        Supabase.instance.client.channel('bang_don_tra')
        .onPostgresChanges(
            event: PostgresChangeEvent.update,
            schema: 'public',
            table: 'bang_don_tra',
            filter: PostgresChangeFilter(
                type: PostgresChangeFilterType.eq,
                column: 'ma_chuyen',
                value: userStorage.getMaChuyen()),
            callback: (payload) {
              if (!isHoanThanh(payload.newRecord)) {
              }
            })
        .subscribe();
	}

	Future<void> fetchTramListAndChuyen() async {
  final chuyen = await tuyenService.getChuyenXe(userStorage.getMaChuyen());
  final tram = await tuyenService.getTramFromTuyen(chuyen?.maTuyen ?? "");
	if(chuyen != null && tram != null) {
		tramList.value = tram;	
		chuyenXe.value = chuyen;
    isLoading.value = false;
		}
	}

	Future<void> hoanThanhTram(String maTram) async {
    await driverService.hoanThanhTram(maTram);
	}

  bool isHoanThanh(Map<String, dynamic> donTra) {
    return donTra['hoan_thanh'];
  }
} 
