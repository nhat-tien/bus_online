import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {super.key,
      required this.logoPath,
      required this.title,
		  this.primary = false,
      this.routePath = ""});

  final String logoPath;
  final String title;
  final String routePath;
	final bool primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Get.toNamed(routePath)},
      child: Container(
        width: 160,
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: primary ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x00949393).withOpacity(1),
                offset: const Offset(0, 0),
                blurRadius: 7,
                spreadRadius: -2,
              )
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: primary ? const Color(0xffff9170) : const Color(0xffe3e1e1),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Image.asset(
              logoPath,
              fit: BoxFit.fitWidth,
            ),
          ),
          // Image.asset(
          //   logoPath,
          //   fit: BoxFit.fitWidth,
          // ),
					const SizedBox(height: 15,),
          Text(
            title,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: primary ? Colors.white : Colors.black,
              fontWeight: primary ? FontWeight.w600 : FontWeight.w500,
              fontSize: 16,
            ),
          )
        ]),
      ),
    );
  }
}
