import 'dart:ui';

import 'package:budgetly/core/presentation/utils/get_contrast_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // Observing Platform brightness
  var brightness = MediaQuery.of(Get.context!).platformBrightness.obs;
  var isDarkMode =
      (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark).obs;

  // the currently selected tab
  var currentTabIndex = 0.obs;

  //  fab icon based on the currentIndex
  var fabIcon = Icon(
    Icons.add,
    color: getTextColorForBackground(
        backgroundColor: Theme.of(Get.context!).primaryColor),
  ).obs;

  // bool isDarkMode() => brightness.value == Brightness.dark;

  void onTabChanged({required int index}) {
    currentTabIndex.value = index;

    if (index == 0) {
      fabIcon.value = Icon(Icons.add,
          color: getTextColorForBackground(
              backgroundColor: Theme.of(Get.context!).primaryColor));
    } else if (index == 1) {
      fabIcon.value = Icon(Icons.add_card_sharp,
          color: getTextColorForBackground(
              backgroundColor: Theme.of(Get.context!).primaryColor));
    } else if (index == 2) {
      fabIcon.value = Icon(Icons.fastfood_sharp,
          color: getTextColorForBackground(
              backgroundColor: Theme.of(Get.context!).primaryColor));
    } else {
      fabIcon.value = Icon(Icons.add,
          color: getTextColorForBackground(
              backgroundColor: Theme.of(Get.context!).primaryColor));
    }
  }
}
