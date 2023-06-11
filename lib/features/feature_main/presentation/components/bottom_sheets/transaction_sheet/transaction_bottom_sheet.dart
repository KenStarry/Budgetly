import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/transaction_sheet/toggle_button.dart';
import 'package:flutter/material.dart';

void showTransactionBottomSheet(
        {required BuildContext context, String transactionType = 'income'}) =>
    showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        //  toggle buttons
                        UnconstrainedBox(
                          child: Container(
                           padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.grey
                            ),
                            child: Row(
                              children: [
                                TransactionToggleButton(title: 'Income', onTap: () {},),
                                const SizedBox(width: 8,),
                                TransactionToggleButton(title: 'Transfer', onTap: () {},),
                                const SizedBox(width: 8,),
                                TransactionToggleButton(title: 'Expense', onTap: () {},),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            transactionType == 'income'
                                ? 'Income'
                                : transactionType == 'expense'
                                    ? 'Expense'
                                    : transactionType == 'transfer'
                                        ? 'Transfer'
                                        : 'Income',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        useSafeArea: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )));
