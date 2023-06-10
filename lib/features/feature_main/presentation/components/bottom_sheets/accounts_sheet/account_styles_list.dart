import 'package:budgetly/features/feature_accounts/domain/model/account_card_styles.dart';
import 'package:budgetly/core/presentation/components/account_card/account_card_1.dart';
import 'package:budgetly/features/feature_accounts/presentation/controller/accounts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            onTap: () {
              accountsController.changeAccountCardStyle(style: currentStyle);
            },
            child: UnconstrainedBox(
              child: SizedBox(
                width: 120,
                height: 80,
                child: Obx(
                  () => Stack(children: [
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: accountCardVariants(
                            accName: '',
                            accBal: 0.00,
                            accDate: '',
                            isContentVisible: false)[index]),

                    //  tick
                    accountsController.accountCardStyle.value == currentStyle
                        ? Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                              child: Icon(
                                Icons.done,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color,
                                size: 16,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ]),
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
