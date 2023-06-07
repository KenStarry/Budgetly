import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';
import 'package:hive/hive.dart';

class AccountsRepositoryImpl implements AccountsRepository {

  //  hive box
  final Box accountsBox = Hive.box(HiveUtils.accountsBox);

  @override
  Future<void> addAccountToDB({required Account account}) async {
    await accountsBox.add(account);
  }

  @override
  Future<Box<dynamic>> getAccountsFromDB() async {
    return accountsBox;
  }
}