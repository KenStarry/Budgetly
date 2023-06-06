import 'package:budgetly/core/domain/models/account.dart';

abstract class AccountsRepository {
  //  add account to hive
  Future<void> addAccountToDB({required Account account});

  //  get accounts from hive
  Future<List<Account>> getAccountsFromDB();
}
