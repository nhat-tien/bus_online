import 'package:bus_online/components/heading_with_back_button.dart';
import 'package:bus_online/controllers/tuyen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TuyenPage extends StatelessWidget {
  final TuyenController tuyenController = Get.put(TuyenController());
  TuyenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
				const HeadingWithBackButton(title: 'Danh sách tuyến'),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Obx(() => tuyenController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (BuildContext context, index) =>
                          const SizedBox(
                        height: 16,
                      ),
                      itemCount: tuyenController.tuyenList.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title:
                              Text(tuyenController.tuyenList[index].tenTuyen),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          tileColor: Colors.grey[200],
												onTap: () {
                         Get.toNamed('/chi-tiet-tuyen', arguments: [ 
														tuyenController.tuyenList[index].maTuyen,
														tuyenController.tuyenList[index].tenTuyen,
													]);
												},
                        );
                      },
                    ))),
        )
      ],
    )));
  }
}
