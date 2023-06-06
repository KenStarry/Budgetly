import 'package:budgetly/core/utils/math_utils.dart';
import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';

class AccountCard extends StatelessWidget {
  final String accountName;
  final double accountBalance;
  final String currentDate;

  const AccountCard(
      {Key? key,
      required this.accountName,
      required this.accountBalance,
      required this.currentDate})
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
            //  background image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  "assets/images/card_pattern1.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
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
            Container(
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
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: MathUtils.addComma(number: accountBalance),
                          style: Theme.of(context).textTheme.titleLarge),
                    ]))
                  ],
                )),

            //  account name
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  creation date
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_outlined,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(currentDate,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),

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
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
