import 'package:bus_online/components/full_width_button.dart';
import 'package:bus_online/controllers/dang_ki_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingPage extends StatelessWidget {
  final DangKiVeController controller = Get.put(DangKiVeController());
  BookingPage({super.key});

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
                    'Tuyến',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x00949393).withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 7,
                          spreadRadius: -2,
                        )
                      ]),
                  child: Obx(() => DropdownMenu(
                        width: 320,
                        controller: controller.tuyenTextController,
                        dropdownMenuEntries:
                            controller.listOfTuyen.map((element) {
                          return DropdownMenuEntry(
                            value: element,
                            label: element.tenTuyen,
                          );
                        }).toList(),
                        onSelected: controller.setTuyen,
                        hintText: "Chọn tuyến đường",
                        inputDecorationTheme: const InputDecorationTheme(
                          constraints: BoxConstraints(maxHeight: 50),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Trạm đi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x00949393).withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 7,
                          spreadRadius: -2,
                        )
                      ]),
                  child: Obx(() => DropdownMenu(
                        width: 320,
                        controller: controller.tramDiTextController,
                        dropdownMenuEntries:
                            controller.listOfTram.map((element) {
                          return DropdownMenuEntry(
                            value: element,
                            label: element.tenTram,
                          );
                        }).toList(),
                        onSelected: controller.setTramDi,
                        hintText: "Chọn trạm đi",
                        inputDecorationTheme: const InputDecorationTheme(
                          constraints: BoxConstraints(maxHeight: 50),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Trạm đến',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x00949393).withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 7,
                          spreadRadius: -2,
                        )
                      ]),
                  child: Obx(() => DropdownMenu(
                        width: 320,
                        controller: controller.tramDenTextController,
                        dropdownMenuEntries:
                            controller.listOfTram.map((element) {
                          return DropdownMenuEntry(
                            value: element,
                            label: element.tenTram,
                          );
                        }).toList(),
                        onSelected: controller.setTramDen,
                        hintText: "Chọn trạm đến",
                        inputDecorationTheme: const InputDecorationTheme(
                          constraints: BoxConstraints(maxHeight: 50),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Số lượng',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(width: 1, color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x00949393).withOpacity(1),
                            offset: const Offset(0, 0),
                            blurRadius: 7,
                            spreadRadius: -2,
                          )
                        ],
                      ),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            controller.decreaseNumberOfTicket();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 25, 15),
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                        Obx(() => Text(
                              '${controller.numberOfTicket.value}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            controller.increaseNumberOfTicket();
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(25, 15, 15, 15),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: FullWidthButton(
                    onPressed: () {
                      Get.toNamed('/chon-chuyen-xe');
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
          ),
        ),
      ),
    );
  }
}
