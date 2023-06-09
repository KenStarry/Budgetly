import '../../../../core/domain/models/account.dart';
import '../../../../di/locator.dart';
import '../repository/accounts_repository.dart';

class DeleteAccount {

  final AccountsRepository repo = locator.get<AccountsRepository>();

  Future<void> invoke({required Account account}) async {
    await repo.deleteAccountFromDB(account: account);
  }
}