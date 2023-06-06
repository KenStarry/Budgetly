import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';

class GetAccounts {

  AccountsRepository repo = locator.get<AccountsRepository>();

  Future<List<Account>> getAccounts() async {
    return await repo.getAccountsFromDB();
  }
}