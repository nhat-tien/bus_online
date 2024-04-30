import 'package:bus_online/components/heading_with_back_button.dart';
import 'package:bus_online/controllers/chi_tiet_tuyen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChiTietTuyenPage extends StatelessWidget {
  final ChiTietTuyenController controller = Get.put(ChiTietTuyenController());
  ChiTietTuyenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingWithBackButton(title: 'Chi tiết tuyến'),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
											const Text(
												"Lộ trình",
												style: TextStyle(
													fontSize: 18,
													fontWeight: FontWeight.w600,
												),
											),
                      const SizedBox(height: 10,),
                      Text(
												controller.loTrinh,
												style: const TextStyle(
													fontSize: 17,
												),
											),
                      const SizedBox(height: 10,),
                      const Text(
												"Danh sách các chuyến xe",
												style: TextStyle(
													fontSize: 18,
													fontWeight: FontWeight.w600,
												),
											),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Mã chuyến')),
                                DataColumn(label: Text('Mã xe')),
                                DataColumn(label: Text('Giờ lượt đi')),
                                DataColumn(label: Text('Giờ lượt về')),
                              ],
                              rows: controller.chuyenXeList
                                  .map((element) => DataRow(cells: [
                                        DataCell(Text(element.maChuyen)),
                                        DataCell(Text(element.maXe)),
                                        DataCell(Text(element.gioLuotDi)),
                                        DataCell(Text(element.gioLuotVe)),
                                      ]))
                                  .toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
          ))
        ],
      )),
    );
  }
}
