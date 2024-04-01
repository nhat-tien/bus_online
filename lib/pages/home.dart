import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Home")])),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
