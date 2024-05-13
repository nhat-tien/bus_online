import 'package:bus_online/controllers/quan_li_ve_controller.dart';
import 'package:bus_online/utils/format_currency.dart';
import 'package:bus_online/utils/format_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuanLiVe extends StatelessWidget {
  QuanLiVe({super.key});

  final QuanLiVeController controller = Get.put(QuanLiVeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => controller.isLoading.value
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : ListView.builder(
          itemCount: controller.listOfVe.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00949393).withOpacity(1),
                        offset: const Offset(0, 0),
                        blurRadius: 7,
                        spreadRadius: -2,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Tên hành khách: ",
                            style: DefaultTextStyle.of(context).style,
                            children: [
                          TextSpan(
                              text: controller.listOfVe[index].tenHanhKhach,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "Tiền vé: ",
                            style: DefaultTextStyle.of(context).style,
                            children: [
                          TextSpan(
                              text: formatCurrency(controller.listOfVe[index].tienPhi),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "Thời điểm quét: ",
                            style: DefaultTextStyle.of(context).style,
                            children: [
                          TextSpan(
                              text: formatDate("d/m/Y H:M:S",
                        controller.listOfVe[index].updatedAt),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600))
                        ])),
                    RichText(
                        text: TextSpan(
                            text: "Số lượng: ",
                            style: DefaultTextStyle.of(context).style,
                            children: [
                          TextSpan(
                              text: controller.listOfVe[index].soLuong,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600))
                        ])),
                  ],
                ),
              ),
            );
          },
        ),
        );
  }
}
