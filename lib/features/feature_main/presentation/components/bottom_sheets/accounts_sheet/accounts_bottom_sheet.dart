import 'package:budgetly/features/feature_accounts/presentation/components/account_card.dart';
import 'package:flutter/material.dart';

void showAccountsBottomSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            children: [
              //  bottom sheet drag icon
              Container(
                width: 50,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade600),
              ),

              Text(
                "Add Account",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              const SizedBox(
                height: 16,
              ),

              //  account card to be customized
              const AccountCard(),

              const SizedBox(
                height: 16,
              ),

              //  details heading

              //  account name
              //  account balance
              //  submit button
            ],
          ),
        ),
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    )));
