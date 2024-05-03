import 'package:bus_online/components/full_width_button.dart';
import 'package:bus_online/controllers/dang_ki_controller.dart';
import 'package:bus_online/utils/format_currency.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class XacNhan extends StatelessWidget {
  final DangKiVeController controller = Get.put(DangKiVeController());
  XacNhan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Vé Xe Bus',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trạm đi',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Obx(() => Text(
                            controller.tramDiSelected.value?.tenTram ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )),
                    ),
                    const Text('Mã chuyến',
                        style: TextStyle(
                          color: Colors.black54,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Obx(() => Text(
                              controller.chuyenXeSelected.value?.maChuyen ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ))),
                    const Text('Số lượng',
                        style: TextStyle(
                          color: Colors.black54,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Obx(() => Text(
                            '${controller.numberOfTicket.value}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Trạm đến',
                        style: TextStyle(
                          color: Colors.black54,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Obx(() => Text(
                            controller.tramDenSelected.value?.tenTram ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )),
                    ),
                    const Text('Giờ khởi hành',
                        style: TextStyle(
                          color: Colors.black54,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Obx(() => controller.chieuDiCuaHanhKhach.value ==
                                "di"
                            ? Text(
                                controller.chuyenXeSelected.value?.gioLuotDi ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              )
                            : Text(
                                controller.chuyenXeSelected.value?.gioLuotVe ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ))),
          const Text(
            'Tiền phí',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Obx(() => Text(
                    '${formatCurrency(controller.fee.value)}đ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ))),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Lưu ý',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Xin hãy kiểm tra thông tin đầy đủ, chính xác trước khi xác nhận',
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: FullWidthButton(
              onPressed: () {
                controller.submit();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Xác nhận',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.check,
                    size: 27,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
