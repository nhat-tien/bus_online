import 'package:flutter/material.dart';
import 'package:bus_online/components/service_item.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Dịch vụ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Expanded(
          // 	child: ListView.builder(
          // 		itemCount: features.length,
          // 		itemBuilder: (_, index){
          // 			final feature = features[index];
          // 			return ServiceItem(feature: feature);
          // 		}
          // 	),
          // ),
          Wrap(
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
          )
        ]));
  }
}
