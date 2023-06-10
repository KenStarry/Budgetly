import 'package:budgetly/core/utils/math_utils.dart';
import 'package:budgetly/features/feature_accounts/presentation/components/income_card.dart';
import 'package:budgetly/theme/card_styles.dart';
import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';

class AccountCard extends StatelessWidget {
  final String accountName;
  final double accountBalance;
  final String currentDate;
  final bool isContentVisible;

  const AccountCard(
      {Key? key,
      required this.accountName,
      required this.accountBalance,
      required this.currentDate,
      this.isContentVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.loose,
          children: [
            //  canvas
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: CardStyles.roundedLinesStyle(
                    color: Theme.of(context).primaryColor),
              ),
            ),

            //  gradient color
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          MyColors.lightColors['accent_4']!.withOpacity(0.6),
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.6)
                        ]))),

            //  main content
            isContentVisible == true
                ? Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Balance",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Ksh. ",
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                              text: MathUtils.addComma(number: accountBalance),
                              style: Theme.of(context).textTheme.titleMedium),
                        ]))
                      ],
                    ))
                : SizedBox.shrink(),

            //  account name
            isContentVisible == true ? Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.wallet,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(accountName,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    ),
                  ],
                ),
              ),
            ) : SizedBox.shrink(),
          ],
        ));
  }
}
