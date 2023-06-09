import 'package:budgetly/features/feature_accounts/domain/use_cases/add_account.dart';

import 'delete_account.dart';

class AccountsUseCases {
  AddAccount addAccount;
  DeleteAccount deleteAccount;

  AccountsUseCases({required this.addAccount, required this.deleteAccount});
}
