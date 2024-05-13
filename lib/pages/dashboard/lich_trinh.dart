import 'package:bus_online/controllers/lich_trinh_controller.dart';
import 'package:bus_online/controllers/quan_li_ve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LichTrinh extends StatelessWidget {
  LichTrinh({super.key});

  final LichTrinhController controller = Get.put(LichTrinhController());
  final QuanLiVeController quanLiVeController = Get.put(QuanLiVeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_downward),
                      RichText(
                          text: TextSpan(
                              text: "Giờ lượt đi ",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              children: [
                            TextSpan(
                                text: controller.chuyenXe.value?.gioLuotDi ??
                                    "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600))
                          ])),
                    ])),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: controller.tramList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x00949393).withOpacity(1),
                              offset: const Offset(0, 0),
                              blurRadius: 7,
                              spreadRadius: -2,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.tramList[index].tenTram,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(onPressed: () {
															controller.hoanThanhTram(controller.tramList[index].maTram);
															quanLiVeController.reload();
														}, child: const Text("Đã đến"))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_upward),
                      RichText(
                          text: TextSpan(
                              text: "Giờ lượt về ",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              children: [
                            TextSpan(
                                text: controller.chuyenXe.value?.gioLuotVe ??
                                    "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600))
                          ])),
                    ])),
          ]));
  }
}
