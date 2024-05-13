import 'package:bus_online/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Get.put(RegisterController());
  final formKey = GlobalKey<FormState>();

  final field1Key = GlobalKey<FormFieldState>();
  final field2Key = GlobalKey<FormFieldState>();
  final field3Key = GlobalKey<FormFieldState>();
  final field4Key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      resizeToAvoidBottomInset: false,
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
                  const Text(
                    'ĐĂNG KÍ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formKey,
                      child: Builder(builder: (BuildContext context) {
                        return Column(children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                        key: field1Key,
                                        obscureText: false,
                                        controller: controller.nameController,
                                            autovalidateMode:
                                                AutovalidateMode.onUserInteraction,
                                        validator: (value) =>
                                            controller.nameValidator(value!),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Tên',
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.person),
                                            ))),
                                  ))),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                        key: field2Key,
                                        obscureText: false,
                                        controller: controller.emailController,
                                            autovalidateMode:
                                                AutovalidateMode.onUserInteraction,
                                        validator: (value) =>
                                            controller.emailValidator(value!),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Email',
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.person),
                                            ))),
                                  ))),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Obx(
                                        () => TextFormField(
                                            key: field3Key,
                                            obscureText: !controller
                                                .passwordVisible.value,
                                            controller:
                                                controller.passwordController,
                                            autovalidateMode:
                                                AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              return controller
                                                  .passwordValidator(value!);
                                            },
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Mật khẩu',
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.lock,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      controller.passwordVisible
                                                              .value =
                                                          !controller
                                                              .passwordVisible
                                                              .value;
                                                    },
                                                    icon: Icon(controller
                                                            .passwordVisible
                                                            .value
                                                        ? Icons.visibility
                                                        : Icons
                                                            .visibility_off)))),
                                      )))),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Obx(
                                        () => TextFormField(
                                            key: field4Key,
                                            obscureText: !controller
                                                .repeatPasswordVisible.value,
                                            controller: controller
                                                .repeatPasswordController,
                                            autovalidateMode:
                                                AutovalidateMode.onUserInteraction,
                                            validator: (value) {
                                              return controller
                                                  .repeatPasswordValidator(
                                                      value!);
                                            },
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Nhập Lại Mật khẩu',
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Icon(
                                                    Icons.lock,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      controller
                                                              .repeatPasswordVisible
                                                              .value =
                                                          !controller
                                                              .repeatPasswordVisible
                                                              .value;
                                                    },
                                                    icon: Icon(controller
                                                            .repeatPasswordVisible
                                                            .value
                                                        ? Icons.visibility
                                                        : Icons
                                                            .visibility_off)))),
                                      )))),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.register();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff50AAF7),
                              ),
                              child: const Text(
                                'XONG !',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ))
                        ]);
                      }))
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: TextButton(
                      onPressed: () {
                        Get.offNamed('/login');
                      },
                      child: const Text(
                        'Bạn đã có tài khoản?, đi đến đăng nhập',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
