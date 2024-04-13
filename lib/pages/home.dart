import "package:bus_online/controllers/navigation_controller.dart";
import "package:bus_online/pages/personal.dart";
import "package:bus_online/pages/service.dart";
import "package:bus_online/pages/message.dart";
import "package:bus_online/storage/user_storage.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavigationController controller = Get.put(NavigationController());
  final UserStorage storage = UserStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Obx(() => NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.notifications_none),
                    label: 'Thông báo',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.segment_rounded),
                    label: 'Dịch vụ',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.perm_identity),
                    label: 'Cá nhân',
                  ),
                ],
                selectedIndex: controller.currentPageIndex.value,
                onDestinationSelected: (int index) {
                  controller.setPage(index);
                },
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
              )),
        ),
      ),
      body: SafeArea(
          child: Obx(
        () => <Widget>[
          HomePage(userName: storage.getName()),
          MessagePage(),
          const ServicePage(),
          const PersonalPage()
        ][controller.currentPageIndex.value],
      )),
      backgroundColor: Colors.white,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.userName});

  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Xin chào bạn!',
            style: TextStyle(
              color: Color(0xFF626262),
              fontSize: 18,
            ),
          ),
          Text(
            '$userName',
            style: const TextStyle(
              color: Color(0xFFF9A000),
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
          ),
					const SizedBox(
						height: 20,
						),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.network(
              'https://cdn1.img.sputniknews.vn/img/07e6/02/03/13560397_84:0:1417:1000_1920x0_80_0_0_c74c0dc5e7acbe1783ca22be16fbbbef.jpg',
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
