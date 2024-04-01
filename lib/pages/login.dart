import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: -80,
								right: -80,
                child: Container(
                    width: 210,
                    height: 210,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle))),
            Positioned(
                bottom: -80,
							  left: -80,
                child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Đăng nhập'),
                  Form(child: Builder(builder: (BuildContext context) {
                    return Column(children: [
                      TextFormField(),
                      TextFormField(),
                      // ElevatedButton(onPressed: onPressed, child: child)
                    ]);
                  }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// TextField(
// //    ...,other fields
//       decoration: InputDecoration(
//         prefixIcon: prefixIcon??Icon(Icons.done),
//       ),
//     ),
