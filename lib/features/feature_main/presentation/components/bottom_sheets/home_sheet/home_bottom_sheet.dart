import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/home_sheet/quick_action_pill.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';

import '../transaction_sheet/transaction_bottom_sheet.dart';

void showHomeBottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: [
                  Column(
                    children: [
                      Text(
                        "Quick Actions",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //  income and expense actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          QuickActionPill(
                            pillTitle: "Income",
                            pillIcon: Icons.show_chart_outlined,
                            pillColor: MyColors.lightColors['success']!,
                            onTap: () {
                              Navigator.pop(context);
                              showTransactionBottomSheet(
                                context: context, transactionType: 'income');
                            },
                          ),

                          // const SizedBox(width: 24,),

                          QuickActionPill(
                            pillTitle: "Transfer",
                            pillIcon: Icons.account_balance_wallet,
                            pillColor: MyColors.lightColors['accent_3']!,
                            onTap: () {
                              Navigator.pop(context);
                              showTransactionBottomSheet(
                                context: context, transactionType: 'transfer');
                            },
                          ),

                          // const SizedBox(width: 24,),

                          QuickActionPill(
                            pillTitle: "Expense",
                            pillIcon: Icons.show_chart_outlined,
                            pillColor: MyColors.lightColors['error']!,
                            onTap: () {
                              Navigator.pop(context);
                              showTransactionBottomSheet(
                                context: context, transactionType: 'expense');
                            },
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ))).whenComplete(() {
      //  do stuff when complete
    });
