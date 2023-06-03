import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFormController extends GetxController {
  //  account name controller
  var accountName = "Account Name".obs;

  void updateAccountName({required String name}) => accountName.value = name;
}
