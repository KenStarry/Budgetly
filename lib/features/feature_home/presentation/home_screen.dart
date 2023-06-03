import 'package:budgetly/features/feature_home/presentation/components/balance_card.dart';
import 'package:flutter/material.dart';

import '../../feature_main/presentation/components/main_app_bar.dart';
import '../../feature_main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final MainController _controller;

  @override
  void initState() {
    super.initState();

    _controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: mainAppBar(context: context, controller: _controller),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //  greetings
              //  balance
              BalanceCard()
            ],
          ),
        ),
      ),
    );
  }
}
