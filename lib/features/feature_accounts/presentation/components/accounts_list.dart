import 'package:budgetly/core/presentation/components/my_lottie.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../core/domain/models/account.dart';
import '../controller/accounts_controller.dart';
import '../../../../core/presentation/components/account_card/account_card_1.dart';

class AccountsList extends StatelessWidget {
  final AccountsController accountsController;

  const AccountsList({Key? key, required this.accountsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ValueListenableBuilder(
          valueListenable: accountsController.accounts.value,
          builder: (context, box, widget) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              accountsController.getTotal(box);
            });

            return box.length != 0
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final account = box.getAt(index) as Account;

                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const DrawerMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              accountsController.deleteAccount(index: index);
                            },
                            icon: Icons.delete,
                            label: 'Delete',
                            backgroundColor: MyColors.lightColors['error']!,
                            borderRadius: BorderRadius.circular(16),
                          )
                        ]),
                        child: AccountCard1(
                            accountName: account.accountName,
                            accountBalance: account.accountBalance,
                            currentDate: account.accountCreated.toString()),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                  )
                : Column(
                    children: [
                      const MyLottie(
                        lottie: 'assets/lottie/credit_card.json',
                      ),
                      const Text('Add accounts to see them here.'),
                      const SizedBox(height: 24,),
                      Icon(
                        Icons.arrow_downward,
                        size: 16,
                        color: Theme.of(context).iconTheme.color,
                      )
                    ],
                  );
          },
        ));
  }
}
