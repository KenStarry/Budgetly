import 'dart:ffi';

import 'package:hive/hive.dart';

//  generate adapter using this command
//  flutter packages pub run build_runner build
part 'account.g.dart';

@HiveType(typeId: 1)
class Account extends HiveObject {
  @HiveField(0, defaultValue: "")
  final String accountName;

  @HiveField(1, defaultValue: 0.00)
  final double accountBalance;

  @HiveField(2, defaultValue: null)
  final DateTime accountCreated;

  Account(
      {required this.accountName,
      required this.accountBalance,
      required this.accountCreated});
}
