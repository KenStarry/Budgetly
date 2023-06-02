import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

  /// Observing Platform brightness
  var brightness = MediaQuery.of(Get.context!).platformBrightness.obs;

  bool isDarkMode() => brightness.value == Brightness.dark;
}