import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;

  late ScrollController controller;
  final RxBool _showFab = true.obs;
  RxBool get showFab => _showFab;
  final RxBool _isElevated = true.obs;
  RxBool get isEleveted => _isElevated;
  final RxBool _isVisible = true.obs;
  RxBool get isVisible => _isVisible;
  void onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  FloatingActionButtonLocation get fabLocation => _isVisible.value
      ? FloatingActionButtonLocation.endContained
      : FloatingActionButtonLocation.centerFloat;

  void _listen() {
    final ScrollDirection direction = controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible.value) {
      _isVisible.value = true;
    }
  }

  void _hide() {
    if (_isVisible.value) {
      _isVisible.value = false;
    }
  }

  @override
  void onInit() {
    controller = ScrollController();
    controller.addListener(_listen);
    super.onInit();
  }

  @override
  void dispose() {
    controller.removeListener(_listen);
    controller.dispose();
    super.dispose();
  }
}
