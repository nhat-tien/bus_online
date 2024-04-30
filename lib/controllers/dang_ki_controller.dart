import 'package:bus_online/models/chuyen_xe.dart';
import 'package:bus_online/models/tram.dart';
import 'package:bus_online/models/tuyen.dart';
import 'package:bus_online/services/customer_service.dart';
import 'package:bus_online/services/tuyen_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DangKiVeController extends GetxController {
	final TuyenService tuyenService = TuyenService();
	final CustomerService customerService = CustomerService();
	final TextEditingController tuyenTextController = TextEditingController();
	final TextEditingController tramDiTextController = TextEditingController();
	final TextEditingController tramDenTextController = TextEditingController();
	final TextEditingController chuyenXeTextController = TextEditingController();
	final tuyenSelected = Rx<Tuyen?>(null);
	final tramDiSelected = Rx<Tram?>(null);
	final tramDenSelected = Rx<Tram?>(null);
	final chuyenXeSelected= Rx<ChuyenXe?>(null);
  final listOfTuyen = <Tuyen>[].obs;
	final listOfTram = <Tram>[].obs;
	final listOfChuyenXe = <ChuyenXe>[].obs;
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
	}

	void setTramDen(Tram? tramDen) {
    tramDenSelected.value = tramDen;
	}

	void setChuyenXe(ChuyenXe chuyenXe) {
		chuyenXeSelected.value = chuyenXe;
	}

	void increaseNumberOfTicket() {
		if(numberOfTicket.value >= 5) return;
		numberOfTicket.value++;
	}

	void decreaseNumberOfTicket() {
    if(numberOfTicket.value == 0) return;
		numberOfTicket.value--;
	}

	Future<void> _initTuyen() async {
    final tuyen = await tuyenService.getAllTuyen();
		if (tuyen != null) {
			listOfTuyen.value = tuyen;
		}
	}

  Future<void> _initTramAndChuyenXe() async { 
		final res = await Future.wait([
       tuyenService.getChuyenXe(tuyenSelected.value?.maTuyen),
			tuyenService.getTramFromTuyen(tuyenSelected.value?.maTuyen)
		]);
		final chuyenXe = res[0] as List<ChuyenXe>?;
		final tram = res[1] as List<Tram>?;
		if (chuyenXe != null && tram != null) {
			listOfTram.value = tram;
			listOfChuyenXe.value = chuyenXe;
	  }
	}
}
