import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentPageIndex = 0.obs;
  
	void setPage(int index) {
		currentPageIndex.value = index;
	}

}
