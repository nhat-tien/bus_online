import 'package:bus_online/controllers/danh_sach_ve_controller.dart';
import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/models/tuyen.dart';
import 'package:bus_online/services/customer_service.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DangKiVeController extends GetxController {
  final TuyenService tuyenService = TuyenService();
  final CustomerService customerService = CustomerService();
  final DanhSachVeController danhSachVecontroller = Get.put(DanhSachVeController());
  final TextEditingController tuyenTextController = TextEditingController();
  final TextEditingController tramDiTextController = TextEditingController();
  final TextEditingController tramDenTextController = TextEditingController();
  final TextEditingController chuyenXeTextController = TextEditingController();
  final tuyenSelected = Rx<Tuyen?>(null);
  final tramDiSelected = Rx<Tram?>(null);
  final tramDenSelected = Rx<Tram?>(null);
  final chuyenXeSelected = Rx<ChuyenXe?>(null);
  final listOfTuyen = <Tuyen>[].obs;
  final listOfTram = <Tram>[].obs;
  final listOfChuyenXe = <ChuyenXe>[].obs;
  final chieuDiCuaHanhKhach = "".obs;
  final numberOfTicket = 0.obs;
  final fee = "".obs;

  @override
  onInit() {
    super.onInit();
    _initTuyen();
  }

  void setTuyen(Tuyen? tuyen) {
    tuyenSelected.value = tuyen;
    _initTramAndChuyenXe();
  }

  void setTramDi(Tram? tramDi) {
    tramDiSelected.value = tramDi;
    _setChieuDiCuaHanhKhach();
    _setTienPhi();
  }

  void setTramDen(Tram? tramDen) {
    tramDenSelected.value = tramDen;
    _setChieuDiCuaHanhKhach();
    _setTienPhi();
  }

  void setChuyenXe(ChuyenXe chuyenXe) {
    chuyenXeSelected.value = chuyenXe;
  }

  void increaseNumberOfTicket() {
    if (numberOfTicket.value >= 5) return;
    numberOfTicket.value++;
    _setTienPhi();
  }

  void decreaseNumberOfTicket() {
    if (numberOfTicket.value == 0) return;
    numberOfTicket.value--;
    _setTienPhi();
  }

  void _setTienPhi() async {
    if (tramDiSelected.value != null &&
        tramDenSelected.value != null &&
        tuyenSelected.value != null &&
        numberOfTicket.value != 0) {
      String? tienPhi = await customerService.tinhTien(
          maTramDi: tramDiSelected.value?.maTram,
          maTramDen: tramDenSelected.value?.maTram,
          maTuyen: tuyenSelected.value?.maTuyen,
          soLuong: numberOfTicket.value);
      if (tienPhi != null) {
        fee.value = tienPhi;
      }
    }
  }

  void _setChieuDiCuaHanhKhach() {
    if (tramDiSelected.value != null && tramDenSelected.value != null) {
      int thuTuTramDen = int.parse(tramDenSelected.value!.thuTuTram);
      int thuTuTramDi = int.parse(tramDiSelected.value!.thuTuTram);
      chieuDiCuaHanhKhach.value = thuTuTramDen - thuTuTramDi >= 0 ? "di" : "ve";
    }
  }

  Future<void> _initTuyen() async {
    final tuyen = await tuyenService.getAllTuyen();
    if (tuyen != null) {
      listOfTuyen.value = tuyen;
    }
  }

  Future<void> _initTramAndChuyenXe() async {
    final res = await Future.wait([
      tuyenService.getTatCaChuyenXe(tuyenSelected.value?.maTuyen),
      tuyenService.getTramFromTuyen(tuyenSelected.value?.maTuyen)
    ]);
    final chuyenXe = res[0] as List<ChuyenXe>?;
    final tram = res[1] as List<Tram>?;
    if (chuyenXe != null && tram != null) {
      listOfTram.value = tram;
      listOfChuyenXe.value = chuyenXe;
    }
  }

  bool kiemTraTramHopLe(BuildContext context) {
   if(tramDiSelected.value?.maTram == tramDenSelected.value?.maTram) {
				CoolAlert.show(
					context: context,
					type: CoolAlertType.warning,
					title: "Hey yo bro!",
					text: "Bạn vừa chọn trạm đi và trạm đến trùng nhau, hãy sửa lại nhé",
					confirmBtnText: 'Ok bro',
				);
			return false;
		}
    return true;
  }

  bool kiemTraTramDaChon(BuildContext context) {
   if(tramDiSelected.value == null || tramDenSelected.value == null) {
				CoolAlert.show(
					context: context,
					type: CoolAlertType.warning,
					title: "Hey yo bro!",
					text: "Bạn chưa chọn trạm",
					confirmBtnText: 'Ok bro',
				);
			return false;
		}
    return true;
  }

  bool kiemTraSoLuongVeDaChon(BuildContext context) {
   if(numberOfTicket.value == 0) {
				CoolAlert.show(
					context: context,
					type: CoolAlertType.warning,
					title: "Hey yo bro!",
					text: "Bạn chưa chọn số vé",
					confirmBtnText: 'Ok bro',
				);
			return false;
		}
    return true;
  }

	bool kiemTraTuyenDaChon(BuildContext contex) {
   if(tuyenSelected.value == null) {
				CoolAlert.show(
					context: contex,
					type: CoolAlertType.warning,
					title: "Hey yo bro!",
					text: "Bạn chưa chọn tuyến",
					confirmBtnText: 'Ok bro',
				);
			return false;
		}
		return true;
	}

	bool kiemTraChuyenXeDaChon(BuildContext contex) {
   if(chuyenXeSelected.value == null) {
				CoolAlert.show(
					context: contex,
					type: CoolAlertType.warning,
					title: "Hey yo bro!",
					text: "Bạn chưa chọn chuyến xe",
					confirmBtnText: 'Ok bro',
				);
			return false;
		}
		return true;
	}

	void resetAllValue() {
		tuyenSelected.value = null;
		tramDiSelected.value = null;
		tramDenSelected.value = null;
		chuyenXeSelected.value = null;
		fee.value = "";
		chieuDiCuaHanhKhach.value = "";
		numberOfTicket.value = 0;
		tuyenTextController.clear();
		tramDiTextController.clear();
		tramDenTextController.clear();
		listOfTram.value = [];
		listOfTuyen.value = [];
		listOfChuyenXe.value = [];
	}

	void submit() async {
    bool status = await customerService.postDonTra(
			maTramDi: tramDiSelected.value!.maTram, 
			maTramDen: tramDenSelected.value!.maTram, 
			maTuyen: tuyenSelected.value!.maTuyen, 
			maChuyen: chuyenXeSelected.value!.maChuyen, 
			soLuong: numberOfTicket.value,
			chieu: chieuDiCuaHanhKhach.value
		);
		if(status) { 
				resetAllValue();
				danhSachVecontroller.reload();
				Get.offNamed('/danh-sach-dang-ki');
		}
	}
}
