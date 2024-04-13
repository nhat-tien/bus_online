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
					children: [
						HeadingWithBackButton(title: 'Chi tiết tuyến'),
            Expanded(
							child: Padding(
								padding: EdgeInsets.all(10),
								child: Obx(() => controller.isLoading.value
									? const Center(child: CircularProgressIndicator())
									:  
									//TODO: 
								),
							)
						)
					],
				)
			),
		);
	}
}
