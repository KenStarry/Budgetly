import 'package:budgetly/core/domain/models/account.dart';
import 'package:hive/hive.dart';

abstract class AccountsRepository {
  //  add account to hive
  Future<void> addAccountToDB({required Account account});

  //  delete account from hive
  Future<void> deleteAccountFromDB({required Account account});
}
