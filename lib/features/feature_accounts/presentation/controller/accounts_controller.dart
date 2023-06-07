import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_accounts/domain/use_cases/accounts_use_cases.dart';
import 'package:get/get.dart';

import '../../../../core/domain/models/account.dart';

class AccountsController extends GetxController {
  //  use cases
  AccountsUseCases useCases = locator.get<AccountsUseCases>();

  //  list of all accounts
  var accounts = [].obs;

  //  add account
  Future<void> addAccount({required Account account}) async {
    await useCases.addAccount.invoke(account: account);
  }

  //  get all accounts
  Future<void> getAccounts() async {
    accounts.value = await useCases.getAccounts.invoke();
  }
}
