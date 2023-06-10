import 'package:budgetly/core/presentation/components/account_card/account_card_1.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/presentation/components/account_card/account_card_2.dart';

enum AccountCardStyles {
  style_1,
  style_2,
  style_3,
  style_4,
}

List<Widget> accountCardVariants(
        {required String accName,
        required double accBal,
        required String accDate,
        required bool isContentVisible}) =>
    [
      AccountCard1(
          accountName: accName,
          accountBalance: accBal,
          currentDate: accDate,
          isContentVisible: isContentVisible),

      AccountCard2(
          accountName: accName,
          accountBalance: accBal,
          currentDate: accDate,
          isContentVisible: isContentVisible),
      AccountCard1(
          accountName: accName,
          accountBalance: accBal,
          currentDate: accDate,
          isContentVisible: isContentVisible),

      AccountCard2(
          accountName: accName,
          accountBalance: accBal,
          currentDate: accDate,
          isContentVisible: isContentVisible),
    ];
