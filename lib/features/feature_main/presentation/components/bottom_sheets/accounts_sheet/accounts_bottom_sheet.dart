import 'package:budgetly/features/feature_accounts/presentation/components/account_card.dart';
import 'package:budgetly/features/feature_main/presentation/controller/main_form_controller.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAccountsBottomSheet(
    BuildContext context, TextEditingController myController) {
  final MainFormController controller = Get.find();

  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
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
                  () => AccountCard(
                    accountName: controller.accountName.value,
                  ),
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
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: MyColors.lightColors['accent_4']
                              ?.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.wallet,
                        color: MyColors.lightColors['accent_4'],
                      ),
                    ),
                    const SizedBox(width: 24,),
                    Expanded(
                      child: TextField(
                        onChanged: (text) =>
                            controller.updateAccountName(name: text),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: "Account Name",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          focusColor: Theme.of(context).primaryColor,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                //  account balance
                //  submit button
              ],
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
    controller.updateAccountName(name: "Account Name");
  });
}
