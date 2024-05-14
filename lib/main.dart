import 'dart:async';

import 'package:bus_online/env_key.dart';
import 'package:bus_online/pages/dang_ki/chi_tiet_dang_ki.dart';
import 'package:bus_online/pages/dang_ki/chon_chuyen_xe.dart';
import 'package:bus_online/pages/dang_ki/danh_sach_dang_ki.dart';
import 'package:bus_online/pages/dang_ki/form_dang_ki.dart';
import 'package:bus_online/pages/dang_ki/xac_nhan_dang_ki.dart';
import 'package:bus_online/pages/dashboard/dashboard.dart';
import 'package:bus_online/pages/home.dart';
import 'package:bus_online/pages/login.dart';
import 'package:bus_online/pages/register.dart';
import 'package:bus_online/pages/scanner/scanner.dart';
import 'package:bus_online/pages/tra_cuu/chi_tiet_tuyen.dart';
import 'package:bus_online/pages/tra_cuu/tra_cuu_tuyen_duong.dart';
import 'package:bus_online/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
	await GetStorage.init();
	WidgetsFlutterBinding.ensureInitialized();
	 await Supabase.initialize(
    url: SupabaseKey.url,
    anonKey: SupabaseKey.apiKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Bus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            // seedColor: Colors.deepPurple, primary: const Color(0xffff5723)),
            seedColor: const Color(0xffff7E56), primary: const Color(0xffff5723)),
        useMaterial3: true,
      ),
			initialRoute: '/',
			getPages: [
				GetPage(name: '/', page: () => const MyHomePage(title: 'Bus Online')),
				GetPage(name: '/login', page: () => const LoginPage()),
				GetPage(name: '/register', page: () => const RegisterPage()),
				GetPage(name: '/home', page: () => HomeScreen()),
				GetPage(name: '/tuyen', page: () => TuyenPage()),
				GetPage(name: '/chi-tiet-tuyen', page: () => ChiTietTuyenPage()),
        GetPage(name: '/danh-sach-dang-ki', page: () => DanhSachDangKi()),
				GetPage(name: '/chi-tiet', page: () => ChiTietVe()),
        GetPage(name: '/dang-ki-chuyen', page: () => BookingPage()),
				GetPage(name: '/chon-chuyen-xe', page: () => ChonChuyenXe()),
				GetPage(name: '/xac-nhan', page: () => XacNhan()),
				GetPage(name: '/scanner', page: () => const BarcodeScannerWithController()),
				GetPage(name: '/dashboard', page: () => const Dashboard()),
			],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => SplashScreenState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class SplashScreenState extends State<MyHomePage> {
  final AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => const LoginPage())));
    Timer(
      const Duration(seconds: 3),
      () {
        if (auth.isLogin()) {
          Get.offNamed('/home');
        } else {
				  Get.offNamed('/login');
				}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 210,
                  height: 210,
                  decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9), shape: BoxShape.circle),
                ),
                Image.asset(
                  'assets/images/ic_launcher.png',
                  width: 200,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'SMART BUS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            const Padding(
							padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'by Tin and Tien',
                style: TextStyle(
                  backgroundColor: Colors.transparent,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ])),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
