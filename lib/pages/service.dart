import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final List<Map<String, String>> features = [
    {
      'logo': 'assets/images/leather-jacket-1.png',
      'title': 'Xem lịch trình xe bus',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dịch vụ',
                style: TextStyle(
                  color: Color(0xFF626262),
                  fontSize: 18,
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
                    title: 'Xem lịch trình xe bus',
                  ),
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Xem lịch trình xe bus',
                  ),
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Xem lịch trình xe bus',
                  ),
                  ServiceItem(
                    logoPath: 'assets/images/leather-jacket-1.png',
                    title: 'Xem lịch trình xe bus',
                  ),
                ],
              )
            ]));
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.logoPath, required this.title});

  final String logoPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
				width: 160,
				padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
            Image.asset(
							logoPath,
						fit: BoxFit.fitWidth,
						),
            Text(
              title,
						textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
							  
              ),
            )
          ]),
        ),
    );
  }
}
