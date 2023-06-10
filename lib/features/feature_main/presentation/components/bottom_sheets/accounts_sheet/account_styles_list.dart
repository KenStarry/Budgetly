import 'package:budgetly/features/feature_accounts/domain/model/account_card_styles.dart';
import 'package:budgetly/features/feature_accounts/presentation/components/account_card.dart';
import 'package:budgetly/features/feature_accounts/presentation/controller/accounts_controller.dart';
import 'package:flutter/material.dart';

class AccountStylesList extends StatelessWidget {

  final AccountsController accountsController;

  const AccountStylesList({super.key, required this.accountsController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: AccountCardStyles.values.length,
        itemBuilder: (context, index) {

          var currentStyle = AccountCardStyles.values[index];

          return GestureDetector(
            onTap: () {},
            child: UnconstrainedBox(
              child: SizedBox(
                width: 120,
                height: 80,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                      child: const AccountCard(
                        accountName: '',
                        accountBalance: 0.00,
                        currentDate: '',
                        isContentVisible: false,
                      ),
                    ),

                    //  tick
                    accountsController.accountCardStyle.value == currentStyle ? Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor)
                        ),
                        child: Icon(Icons.done, color: Theme.of(context).textTheme.titleLarge?.color,
                        size: 16,),
                      ),
                    )
                        : const SizedBox.shrink()
                  ]
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
      ),
    );
  }
}
