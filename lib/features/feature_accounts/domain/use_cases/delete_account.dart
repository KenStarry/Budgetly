import '../../../../core/domain/models/account.dart';
import '../../../../di/locator.dart';
import '../repository/accounts_repository.dart';

class DeleteAccount {

  final AccountsRepository repo = locator.get<AccountsRepository>();

  Future<void> invoke({required int index}) async {
    await repo.deleteAccountFromDB(index: index);
  }
}