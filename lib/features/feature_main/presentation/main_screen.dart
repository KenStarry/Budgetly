import 'package:budgetly/features/feature_accounts/presentation/accounts_screen.dart';
import 'package:budgetly/features/feature_categories/presentation/categories_screen.dart';
import 'package:budgetly/features/feature_home/presentation/home_screen.dart';
import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/accounts_sheet/accounts_bottom_sheet.dart';
import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/categories_bottom_sheet.dart';
import 'package:budgetly/features/feature_main/presentation/components/bottom_sheets/home_bottom_sheet.dart';
import 'package:budgetly/features/feature_main/presentation/components/main_app_bar.dart';
import 'package:budgetly/features/feature_main/presentation/components/main_bottom_appbar.dart';
import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:budgetly/features/feature_main/presentation/controller/main_form_controller.dart';
import 'package:budgetly/features/feature_settings/presentation/settings_screen.dart';
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
  late final List<Widget> _pages;

  var myController = TextEditingController();

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
      Obx(
        () {
          if (_controller.currentTabIndex.value == 3) {
            return const SizedBox.shrink();
          }
          return const SizedBox(
            width: 32,
          );
        },
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
    _pages = const [
      HomeScreen(),
      AccountsScreen(),
      CategoriesScreen(),
      SettingsScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {

    Get.put(MainFormController());

    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness:
                _controller.isDarkMode() ? Brightness.light : Brightness.dark),
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Obx(
            () {
              if (_controller.currentTabIndex.value == 3) {
                //  return nothing
                return const SizedBox.shrink();
              }

              return FloatingActionButton(
                onPressed: () {
                  //  show different bottom sheets based on the page
                  if (_controller.currentTabIndex.value == 0) {
                    showHomeBottomSheet(context);
                  } else if (_controller.currentTabIndex.value == 1) {
                    showAccountsBottomSheet(context, myController);
                  } else if (_controller.currentTabIndex.value == 2) {
                    showCategoriesBottomSheet(context);
                  } else {
                    showHomeBottomSheet(context);
                  }
                },
                backgroundColor: MyColors.lightColors['accent_4'],
                child: _controller.fabIcon.value,
              );
            },
          ),
          body: Obx(
            () => IndexedStack(
              index: _controller.currentTabIndex.value,
              children: _pages,
            ),
          ),
          bottomNavigationBar: mainBottomAppBar(tabs: _tabs),
        ));
  }
}
