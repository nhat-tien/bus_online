import 'package:bus_online/components/service_item.dart';
import 'package:bus_online/storage/user_storage.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});
  final UserStorage user = UserStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dịch vụ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
( user.getRole() == "driver" ?
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Dashboard',
                    routePath: '/dashboard',
                    primary: true,
                  ),
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Xem lịch trình xe bus',
                    routePath: '/tuyen',
                  ),
                ],
              )
             : 
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Đăng kí chuyến xe',
                    routePath: '/danh-sach-dang-ki',
                    primary: true,
                  ),
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Xem lịch trình xe bus',
                    routePath: '/tuyen',
                  ),
						],
					))
            ]));
  }
}
