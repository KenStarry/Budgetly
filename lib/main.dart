import 'package:budgetly/di/controllers/controllers_di.dart';
import 'package:budgetly/features/feature_main/presentation/main_screen.dart';
import 'package:budgetly/navigation/nav_constants.dart';
import 'package:budgetly/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ControllersDI.invoke();

    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: NavConstants.mainScreenRoute,
      getPages: [
        GetPage(name: NavConstants.mainScreenRoute, page: () => const MainScreen())
      ],
    );
  }
}
