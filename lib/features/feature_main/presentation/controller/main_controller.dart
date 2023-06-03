import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // Observing Platform brightness
  var brightness = MediaQuery.of(Get.context!).platformBrightness.obs;

  // the currently selected tab
  var currentTabIndex = 0.obs;

  bool isDarkMode() => brightness.value == Brightness.dark;

  void onTabChanged({required int index}) => currentTabIndex.value = index;
}
