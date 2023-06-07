import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'controller/accounts_controller.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {

  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {

    accountsController.getAccounts();

    final accountsBox = Hive.box(HiveUtils.accountsBox);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Accounts", style: Theme.of(context).textTheme.titleMedium,),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Obx(() => ListView.builder(
        itemCount: accountsController.accounts.value.length,
        itemBuilder: (context, index) {

          final account = accountsController.accounts.value.getAt(index) as Account;

          return Text(account.accountName);
        },
      )),
    );
  }
}
