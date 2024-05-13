import 'package:bus_online/services/auth_service.dart';
import 'package:bus_online/storage/user_storage.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({super.key});

  final AuthService auth = AuthService();

  final UserStorage user = UserStorage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          bottom: 480,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )),
          ),
        ),
        Positioned(
            top: 60,
            left: 100,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(width: 3, color: Colors.grey[500]!)),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg'),
              ),
            )),
        Positioned.fill(
          top: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                user.getName(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                user.getRole() == 'driver' ? 'Tài xế' : 'Khách',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]!),
              ),
            ],
          ),
        ),
        Positioned.fill(
            top: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {
										auth.logout();
								},
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Đăng xuất')),
              ],
            )),
      ],
    );
  }
}
