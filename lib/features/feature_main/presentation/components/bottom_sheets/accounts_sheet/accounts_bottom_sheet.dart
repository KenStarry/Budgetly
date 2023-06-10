import 'package:budgetly/core/domain/models/account.dart';
import 'package:budgetly/features/feature_accounts/domain/model/account_card_styles.dart';
import 'package:budgetly/features/feature_accounts/presentation/components/account_card.dart';
import 'package:budgetly/features/feature_accounts/presentation/controller/accounts_controller.dart';
import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/accounts_sheet/account_styles_list.dart';
import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/accounts_sheet/account_text_field.dart';
import 'package:budgetly/features/feature_main/presentation/controller/main_form_controller.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAccountsBottomSheet(
    BuildContext context, TextEditingController myController) {
  final MainFormController controller = Get.find();
  final AccountsController accountsController = Get.find();

  controller.updateCurrentDate();

  showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        )),
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
                        Obx(
                          () {
                            if (accountsController.accountCardStyle ==
                                AccountCardStyles.style_1) {
                              return AccountCard(
                                accountName: controller.accountName.value,
                                accountBalance: controller.accountBalance.value,
                                currentDate: controller.currentDate.value,
                              );
                            }
                            return AccountCard(
                              accountName: controller.accountName.value,
                              accountBalance: controller.accountBalance.value,
                              currentDate: controller.currentDate.value,
                            );
                          },
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //  styles heading
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "Card Styles",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //  card styles list
                        AccountStylesList(
                          accountsController: accountsController,
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //  details heading
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Details",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //  account name
                        AccountTextField(
                          hintText: "Account Name",
                          icon: Icons.wallet,
                          onChanged: (text) {
                            controller.updateAccountName(name: text);
                          },
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        //  account balance
                        AccountTextField(
                            hintText: "Ksh. 0.00",
                            icon: Icons.monetization_on,
                            onChanged: (text) {
                              controller.updateAccountBalance(balance: text);
                            }),

                        const SizedBox(
                          height: 16,
                        ),

                        //  submit button
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: FilledButton(
                            onPressed: () {
                              accountsController.addAccount(
                                  account: Account(
                                      accountName: controller.accountName.value,
                                      accountBalance:
                                          controller.accountBalance.value,
                                      accountCreated: DateTime.now()));

                              //  pop the bottom sheet
                              Get.back(canPop: true);
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    MyColors.lightColors['accent_3']),
                            child: Text("save"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ))).whenComplete(() {
    controller.resetAccountDetails();
  });
}
