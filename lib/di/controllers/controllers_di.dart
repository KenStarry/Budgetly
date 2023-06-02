import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class ControllersDI {

  /// Initialize all controllers
  static void invoke() {
    Get.lazyPut(() => MainController());
  }
}