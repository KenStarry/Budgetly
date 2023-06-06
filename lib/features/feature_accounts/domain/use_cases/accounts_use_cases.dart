import 'package:budgetly/features/feature_accounts/domain/use_cases/add_account.dart';
import 'package:budgetly/features/feature_accounts/domain/use_cases/get_accounts.dart';

class AccountsUseCases {
  AddAccount addAccount;
  GetAccounts getAccounts;

  AccountsUseCases({required this.addAccount, required this.getAccounts});
}
