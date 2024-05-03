import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadingWithBackButton extends StatelessWidget {

	String? backTo;

  HeadingWithBackButton({super.key, required this.title, this.backTo});

	final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
          onPressed: () {
				    if(backTo != null) {
							Get.toNamed(backTo!);
							return;
				    }
            Get.back();
				    return;
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
