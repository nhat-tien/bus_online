import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadingWithBackButton extends StatelessWidget {

  const HeadingWithBackButton({super.key, required this.title});

	final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
          onPressed: () {
            Get.back();
          },
          label: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        );
  }
}
