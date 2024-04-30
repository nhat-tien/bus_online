import 'package:bus_online/components/full_width_button.dart';
import 'package:bus_online/components/sks_ticket_view.dart';
import 'package:bus_online/utils/format_currency.dart';
import 'package:bus_online/utils/format_date.dart';
import 'package:flutter/material.dart';
import 'package:bus_online/controllers/danh_sach_ve_controller.dart';
import 'package:get/get.dart';

class ChiTietVe extends StatelessWidget {
  final DanhSachVeController controller = Get.put(DanhSachVeController());
  final index = Get.arguments;
  ChiTietVe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: SKSTicketView(
                      backgroundPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 24),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      drawTriangle: false,
                      triangleAxis: Axis.vertical,
                      drawArc: true,
                      child: SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              SizedBox(
                                height: 400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xff18a5df),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50)),
                                          ),
                                          child: const Text(
                                            'Vé Thường',
                                            style: TextStyle(
                                              color: Color(0xff18a5df),
                                            ),
                                          )),
                                    ),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          'Vé Xe Bus',
                                          style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Tên hành khách',
                                      style: TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Obx(() => Text(
                                              controller.listOfDonTra[index]
                                                  .tenHanhKhach,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ))),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Trạm đi',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Obx(() => Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .tenTramDi,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20,
                                                      ),
                                                    )),
                                              ),
                                              const Text('Mã chuyến',
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                  )),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Obx(() => Text(
                                                        controller
                                                            .listOfDonTra[index]
                                                            .maChuyen,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ))),
                                              const Text(
                                                'Ngày mua',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Obx(() => Text(
                                                        formatDate(
                                                            "d/m/Y",
                                                            controller
                                                                .listOfDonTra[
                                                                    index]
                                                                .createdAt),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Trạm đến',
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Obx(() => Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .tenTramDen,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20,
                                                      ),
                                                    )),
                                              ),
                                              const Text('Số lượng',
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Obx(() => Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .soLuong,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20,
                                                      ),
                                                    )),
                                              ),
                                              const Text(
                                                'Tiền phí',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Obx(() => Text(
                                                        '${formatCurrency(controller.listOfDonTra[index].tienPhi)}đ',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 170,
                                child: Column(children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                      height: 90,
                                      child: Image.asset(
                                        'assets/images/barcode.png',
                                        fit: BoxFit.fitHeight,
                                      )),
                                  FullWidthButton(
                                      onPressed: () {},
                                      backgroundColor: const Color(0xff18a5df),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.qr_code_scanner,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Quét mã',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )),
                                ]),
                              )
                            ]),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
