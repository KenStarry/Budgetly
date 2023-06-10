import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_accounts/domain/model/account_card_styles.dart';
import 'package:budgetly/features/feature_accounts/domain/use_cases/accounts_use_cases.dart';
import 'package:budgetly/theme/card_styles.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/domain/models/account.dart';

class AccountsController extends GetxController {
  //  use cases
  AccountsUseCases useCases = locator.get<AccountsUseCases>();

  //  list of all accounts
  var accounts = Hive.box(HiveUtils.accountsBox).listenable().obs;

  //  total of all amounts
  var total = 0.00.obs;

  //  selected account card style
  var accountCardStyle = AccountCardStyles.style_2.obs;

  //  add account
  Future<void> addAccount({required Account account}) async {
    await useCases.addAccount.invoke(account: account);
  }

  //  delete account
  Future<void> deleteAccount({required int index}) async {
    await useCases.deleteAccount.invoke(index: index);
  }

  void changeAccountCardStyle({required AccountCardStyles style}) =>
      accountCardStyle.value = style;

  void getTotal(Box accounts) {
    //  clear the total first
    total.value = 0.00;

    for (int i = 0; i < accounts.length; i++) {
      var account = accounts.getAt(i) as Account;
      total.value += account.accountBalance;
      print(account.accountBalance);
    }
  }
}
