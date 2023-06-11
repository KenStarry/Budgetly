import 'package:budgetly/core/presentation/utils/get_contrast_color.dart';
import 'package:budgetly/core/utils/math_utils.dart';
import 'package:budgetly/features/feature_accounts/presentation/components/income_card.dart';
import 'package:budgetly/theme/card_styles.dart';
import 'package:flutter/material.dart';

import '../../../../theme/my_colors.dart';

class AccountCard1 extends StatelessWidget {
  final String accountName;
  final double accountBalance;
  final String currentDate;
  final bool isContentVisible;

  const AccountCard1(
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

            //  gradient color
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).primaryColor)),

            //  canvas
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: CardStyles.roundedLinesStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    strokeWidth: isContentVisible ? 20.0 : 5.0),
              ),
            ),

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
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                            fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
                            color: getTextColorForBackground(backgroundColor: Theme.of(context).primaryColor)
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Ksh. ",
                              style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                                  fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
                                  color: getTextColorForBackground(backgroundColor: Theme.of(context).primaryColor)
                              )),
                          TextSpan(
                              text: MathUtils.addComma(number: accountBalance),
                              style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                                  fontWeight: Theme.of(context).textTheme.titleMedium!.fontWeight,
                                  color: getTextColorForBackground(backgroundColor: Theme.of(context).primaryColor)
                              )),
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
                            style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                                fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
                                color: getTextColorForBackground(backgroundColor: Theme.of(context).primaryColor)
                            ))
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
