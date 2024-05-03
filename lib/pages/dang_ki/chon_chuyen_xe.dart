import 'package:bus_online/components/full_width_button.dart';
import 'package:bus_online/controllers/dang_ki_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChonChuyenXe extends StatelessWidget {
  final DangKiVeController controller = Get.put(DangKiVeController());
  ChonChuyenXe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Đặt vé xe bus',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Chọn chuyến xe',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              const DataColumn(label: Text('Mã chuyến')),
                              const DataColumn(label: Text('Mã xe')),
                              DataColumn(
                                  label: Obx(() =>
                                      controller.chieuDiCuaHanhKhach.value ==
                                              "di"
                                          ? const Text('Giờ lượt đi')
                                          : const Text('Giờ lượt về'))),
                              const DataColumn(label: Text('Chọn')),
                            ],
                            rows: controller.listOfChuyenXe
                                .map((element) => DataRow(cells: [
                                      DataCell(Text(element.maChuyen)),
                                      DataCell(Text(element.maXe)),
                                      DataCell(Obx(() => controller
                                                  .chieuDiCuaHanhKhach.value ==
                                              "di"
                                          ? Text(element.gioLuotDi)
                                          : Text(element.gioLuotVe))),
                                      DataCell(Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.setChuyenXe(element);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 12),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 2),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Text(
                                              'Chọn',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ]))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.chuyenXeSelected.value != null
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const Text(
                                    'Chuyến đã chọn',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text('Mã chuyến'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller.chuyenXeSelected.value!
                                                .maChuyen,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Mã xe'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(controller
                                              .chuyenXeSelected.value!.maXe,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                  																		),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Giờ khởi hành'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                      Obx(
                                        () => controller.chieuDiCuaHanhKhach
                                                    .value ==
                                                "di"
                                            ? Text(controller.chuyenXeSelected
                                                .value!.gioLuotDi,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                  																				)
                                            : Text(controller.chuyenXeSelected
                                                .value!.gioLuotVe,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                  																			),
                                      ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(
                              height: 10,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: FullWidthButton(
                        onPressed: () {
											    if(!controller.kiemTraChuyenXeDaChon(context)) return;
                          Get.toNamed('/xac-nhan');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tiếp tục',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 27,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
