import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;
  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }
}
