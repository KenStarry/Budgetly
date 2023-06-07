import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/core/utils/hive_utils.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AccountsRepoImplMock implements AccountsRepository {
  final Box accountsBox;

  AccountsRepoImplMock({required this.accountsBox});

  @override
  Future<void> addAccountToDB({required Account account}) async {
    await accountsBox.add(account);
  }

  @override
  Future<List<Account>> getAccountsFromDB() async {
    return accountsBox as List<Account>;
  }
}

void main() {
  late final AccountsRepoImplMock accountsRepoImplMock;

  setUpAll(() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter(AccountAdapter());
    Hive.openBox(HiveUtils.accountsBox);
  });

  setUp(() {
    accountsRepoImplMock =
        AccountsRepoImplMock(accountsBox: Hive.box(HiveUtils.accountsBox));
  });

  test('adding an account should add it to Hive database', () {
    //  Given
    accountsRepoImplMock.addAccountToDB(
        account: Account(
            accountName: 'test',
            accountBalance: 1234,
            accountCreated: DateTime.now()));
    //  When
    var myAccounts = accountsRepoImplMock.getAccountsFromDB() as List<Account>;
    //  Then
    expect(myAccounts.length, 1);
  });
}
