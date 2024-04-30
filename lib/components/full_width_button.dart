import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
	final Color? backgroundColor;
  final Function onPressed;
  final Widget child;

  const FullWidthButton(
      {super.key, required this.onPressed, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
				padding: const EdgeInsets.symmetric(vertical:10),
				alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
					borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: child,
      ),
    );
  }
}
