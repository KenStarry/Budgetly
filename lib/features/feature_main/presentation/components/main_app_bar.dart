import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

PreferredSizeWidget mainAppBar(
        {required BuildContext context, required MainController controller}) =>
    AppBar(
      title: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/lady.jpg"),
              radius: 25,
            ),

            const SizedBox(width: 16,),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Sheilla",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Budget",
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      //  display the current monthly budget
                      InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: (){
                          print("month was pressed");
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: MyColors.lightColors['accent_5'],
                          ),
                          child: Text(
                            "June",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
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
