import 'package:budgetly/features/feature_main/presentation/components/main_app_bar.dart';
import 'package:budgetly/features/feature_main/presentation/components/main_bottom_appbar.dart';
import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/bottom_app_bar_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainController _controller;
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();

    _controller = Get.find();
    _tabs = [
      Obx(
        () => Expanded(
            flex: 1,
            child: bottomAppBarIcon(
                title: "Home",
                icon: Icons.home,
                isActive: _controller.currentTabIndex.value == 0,
                onTap: () => _controller.onTabChanged(index: 0))),
      ),
      Obx(
        () => Expanded(
          flex: 1,
          child: bottomAppBarIcon(
              title: "Accounts",
              icon: Icons.credit_card,
              isActive: _controller.currentTabIndex.value == 1,
              onTap: () => _controller.onTabChanged(index: 1)),
        ),
      ),
      const SizedBox(
        width: 32,
      ),
      Obx(
        () => Expanded(
          flex: 1,
          child: bottomAppBarIcon(
              title: "Categories",
              icon: Icons.fastfood_outlined,
              isActive: _controller.currentTabIndex.value == 2,
              onTap: () => _controller.onTabChanged(index: 2)),
        ),
      ),
      Obx(
        () => Expanded(
          flex: 1,
          child: bottomAppBarIcon(
              title: "Settings",
              icon: Icons.settings,
              isActive: _controller.currentTabIndex.value == 3,
              onTap: () => _controller.onTabChanged(index: 3)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness:
                _controller.isDarkMode() ? Brightness.light : Brightness.dark),
        child: Scaffold(
          appBar: mainAppBar(context: context, controller: _controller),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: MyColors.lightColors['accent_4'],
            child: const Icon(Icons.add),
          ),
          body: Obx(() => Center(
              child: Text(
                  "Current Tab is : ${_controller.currentTabIndex.value}"))),
          bottomNavigationBar: mainBottomAppBar(tabs: _tabs),
        ));
  }
}
