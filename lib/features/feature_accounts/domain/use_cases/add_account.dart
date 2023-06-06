import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';

class AddAccount {

  AccountsRepository repo = locator.get<AccountsRepository>();
  
  Future<void> invoke({required Account account}) async {
    await repo.addAccountToDB(account: account);
  }
}