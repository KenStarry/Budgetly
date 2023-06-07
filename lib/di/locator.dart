import 'package:budgetly/features/feature_accounts/data/repository/accounts_repository_impl.dart';
import 'package:budgetly/features/feature_accounts/domain/repository/accounts_repository.dart';
import 'package:budgetly/features/feature_accounts/domain/use_cases/accounts_use_cases.dart';
import 'package:budgetly/features/feature_accounts/domain/use_cases/add_account.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

var locator = GetIt.instance;

void invoke() {
  locator.registerLazySingleton<AccountsRepository>(
      () => AccountsRepositoryImpl());

  locator.registerLazySingleton<AccountsUseCases>(() =>
      AccountsUseCases(addAccount: AddAccount()));
}
