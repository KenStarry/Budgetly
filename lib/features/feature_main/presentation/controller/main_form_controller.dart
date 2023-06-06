import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainFormController extends GetxController {
  //  account name controller
  var accountName = "Account Name".obs;

  //  balance controller
  var accountBalance = 0.00.obs;

  //  date controller
  var currentDate = "".obs;

  void updateAccountName({required String name}) => accountName.value = name;

  void updateAccountBalance({required String balance}) =>
      accountBalance.value = double.parse(balance);

  void updateCurrentDate() {
    var date = DateTime.now();

    currentDate.value = "${date.day}-${date.month}-${date.year}";
  }
}
