import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFormController extends GetxController {
  //  account name controller
  var accountName = "Account Name".obs;

  //  balance controller
  var accountBalance = 0.00.obs;

  void updateAccountName({required String name}) => accountName.value = name;

  void updateAccountBalance({required String balance}) =>
      accountBalance.value = double.parse(balance);
}
