import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/di/locator.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';
import 'package:hive/hive.dart';

class GetAccounts {

  AccountsRepository repo = locator.get<AccountsRepository>();

  Future<Box<dynamic>> invoke() async {
    return await repo.getAccountsFromDB();
  }
}