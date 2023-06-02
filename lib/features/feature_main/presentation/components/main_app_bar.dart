import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

PreferredSizeWidget mainAppBar(
        {required BuildContext context, required MainController controller}) =>
    AppBar(
      title: Text(
        "Home",
        style: Theme.of(context).textTheme.titleSmall,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness:
              controller.isDarkMode() ? Brightness.light : Brightness.dark),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
