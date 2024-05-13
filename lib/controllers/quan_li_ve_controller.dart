import 'package:bus_online/models/don_tra.dart';
import 'package:bus_online/services/driver_service.dart';
import 'package:bus_online/storage/user_storage.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuanLiVeController extends GetxController {
  final UserStorage storage = UserStorage();
  final DriverService driverService = DriverService();
  final listOfVe = <DonTra>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initialListOfVe();
        Supabase.instance.client.channel('bang_don_tra')
        .onPostgresChanges(
            event: PostgresChangeEvent.update,
            schema: 'public',
            table: 'bang_don_tra',
            filter: PostgresChangeFilter(
                type: PostgresChangeFilterType.eq,
                column: 'ma_chuyen',
                value: storage.getMaChuyen()),
            callback: (payload) {
              if (!isHoanThanh(payload.newRecord)) {
                addListOfVe(payload.newRecord);
              }
            })
        .subscribe();
  }

  Future<void> initialListOfVe() async {
    final res = await driverService.getDonTra();

    if (res == null) return;
      List<DonTra> listVe =
          res.where((element) => element.trangThaiThanhToan == "done").toList();
      listOfVe.value = listVe;
    isLoading.value = false;
  }

  void addListOfVe(Map<String, dynamic> res) {
    DonTra donTra = DonTra(
      id: res['id'].toString(),
      maChuyen: res['ma_chuyen'] as String,
      maKhachHang: res['ma_khach_hang'].toString(),
      maTramDi: res['ma_tram_di'] as String,
      maTramDen: res['ma_tram_den'] as String,
      hoanThanh: res['hoan_thanh'],
      trangThaiThanhToan: res['trang_thai_thanh_toan'] as String,
      tienPhi: res['tien_phi'],
      tenTramDi: "",
      tenTramDen: "",
      soLuong: res['so_luong'].toString(),
      createdAt: res['created_at'] as String,
      updatedAt: res['updated_at'] as String,
      tenHanhKhach: res['ten_khach_hang'] as String,
      chieu: res['chieu'] as String,
    );
    listOfVe.value = [ donTra,...listOfVe];
  }

  bool isHoanThanh(Map<String, dynamic> donTra) {
    return donTra['hoan_thanh'];
  }

  Future<void> reload() async {
    isLoading.value = true;
		initialListOfVe();
	}
}
