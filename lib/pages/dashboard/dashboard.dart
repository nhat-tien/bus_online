import 'package:bus_online/pages/dashboard/lich_trinh.dart';
import 'package:bus_online/pages/dashboard/quan_li_ve.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Quản lí vé",
                ),
                Tab(
                  text: "Lịch trình",
                )
              ],
            ),
          ),
          body: TabBarView(
						children: [
							QuanLiVe(),
							LichTrinh(),
						]
					),
        ),
    );
  }
}
