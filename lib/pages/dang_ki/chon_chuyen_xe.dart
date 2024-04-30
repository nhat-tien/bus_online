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
                              rows: controller.listOfChuyenXe
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
						) ,
				))
						),
			);
  }
}
