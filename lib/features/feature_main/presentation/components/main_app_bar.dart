import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

PreferredSizeWidget mainAppBar(
        {required BuildContext context, required MainController controller}) =>
    AppBar(
      title: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/lady.jpg"),
              radius: 30,
            ),

            const SizedBox(width: 16,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Sheilla",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8,),

                Text(
                  "My Wallet",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness:
              controller.isDarkMode() ? Brightness.light : Brightness.dark),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 100,
    );
