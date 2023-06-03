import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // Observing Platform brightness
  var brightness = MediaQuery.of(Get.context!).platformBrightness.obs;

  // the currently selected tab
  var currentTabIndex = 0.obs;
  //  fab icon based on the currentIndex
  var fabIcon = Icon(Icons.add).obs;

  bool isDarkMode() => brightness.value == Brightness.dark;

  void onTabChanged({required int index}) {
    currentTabIndex.value = index;

    if (index == 0) {
      fabIcon.value = const Icon(Icons.add);
    } else if (index == 1) {
      fabIcon.value = const Icon(Icons.add_card_sharp);
      print("This was called");
    } else if (index == 2) {
      fabIcon.value = const Icon(Icons.fastfood_sharp);
    } else {
      fabIcon.value = const Icon(Icons.add);
    }
  }
}



















