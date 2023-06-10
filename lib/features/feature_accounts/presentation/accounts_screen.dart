import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:budgetly/core/utils/math_utils.dart';
import 'package:budgetly/core/presentation/components/account_card/account_card_1.dart';
import 'package:budgetly/features/feature_accounts/presentation/components/accounts_list.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Accounts",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(50),
                    child: Ink(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).primaryColor.withOpacity(0.2)
                      ),
                      child: Icon(Icons.sort, color: Theme.of(context).iconTheme.color,),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  //  total price
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Obx(() => Text(
                          'Ksh. ${MathUtils.addComma(number: accountsController.total.value)}',
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
                child: AccountsList(accountsController: accountsController))
          ],
        ),
      ),
    );
  }
}
