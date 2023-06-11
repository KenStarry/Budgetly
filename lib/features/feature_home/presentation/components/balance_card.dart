import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/math_utils.dart';
import '../../../feature_accounts/presentation/controller/accounts_controller.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({Key? key}) : super(key: key);

  final AccountsController accountsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Stack(
            fit: StackFit.loose,
            children: [

              Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.6),
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
                      Obx(
                        () => Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Ksh. ",
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text: MathUtils.addComma(number: accountsController.total.value),
                              style: Theme.of(context).textTheme.titleLarge),
                        ])),
                      )
                    ],
                  )),

              //  white cutout
              Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        )),
                    child: Center(
                        child: Text(
                      "All Accounts",
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                  )),

              //  greetings
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.cloud, size: 16,),
                      const SizedBox(width: 8,),
                      Text("Good Afternoon", style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
