import 'package:bus_online/controllers/login_controller.dart';
import 'package:bus_online/pages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

	final formKey = GlobalKey<FormState>();

  final LoginController controller = Get.put(LoginController());

	late FocusNode focusNode1;
	late FocusNode focusNode2;
	final field1Key = GlobalKey<FormFieldState>();
	final field2Key = GlobalKey<FormFieldState>();


 @override
  void initState() {
    super.initState();
		focusNode1 = FocusNode();
		focusNode2 = FocusNode();
    focusNode1.addListener(() {
      if (focusNode1.hasFocus) {
        field1Key.currentState!.reset();
      }
    });
    focusNode2.addListener(() {
      if (focusNode2.hasFocus) {
        field2Key.currentState!.reset();
      }
    });
  }

 @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
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
                    'ĐĂNG NHẬP',
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
                          padding: const EdgeInsets.symmetric(horizontal: 25),
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
																focusNode: focusNode1,
                                    obscureText: false,
																autovalidateMode: AutovalidateMode.disabled,
                                    controller: controller.emailController,
                                    validator: (value) {
                                      return controller.emailValidator(value!);
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Tài khoản',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.person),
                                        ))),
                              ))),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
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
																	key: field2Key,
																focusNode: focusNode2,
                                        obscureText:
                                            !controller.passwordVisible.value,
																autovalidateMode: AutovalidateMode.disabled,
                                        controller:
                                            controller.passwordController,
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
                                                CupertinoIcons.lock_fill,
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
                                                        .passwordVisible.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off)))),
                                  )))),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Obx(() => CupertinoSlidingSegmentedControl(
                              groupValue: controller.role.value,
                              children: const {
                                'customer': Text(
                                  'Khách',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                'driver': Text(
                                  'Tài Xế',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              },
                              onValueChanged: (value) {
                                controller.role.value = value!;
                              }))),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
														if(formKey.currentState!.validate()) {
															controller.login();
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
                  })),
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
											        Get.to(RegisterPage());
                            },
                            child: const Text(
                              'Tạo tài khoản tại đây',
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
