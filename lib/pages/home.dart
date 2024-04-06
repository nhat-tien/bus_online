import "package:bus_online/services/auth.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

	AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
								const Text("Home"),
						    ElevatedButton(onPressed: () {
							   auth.logout();
							}, child: const Text('logout'))
							])),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
