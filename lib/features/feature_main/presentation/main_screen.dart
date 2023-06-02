import 'package:budgetly/features/feature_main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainController _controller;

  @override
  void initState() {
    super.initState();

    _controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
            systemNavigationBarIconBrightness:
                _controller.isDarkMode() ? Brightness.light : Brightness.dark),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor,
                statusBarIconBrightness: _controller.isDarkMode()
                    ? Brightness.light
                    : Brightness.dark),
          ),
        ));
  }
}
