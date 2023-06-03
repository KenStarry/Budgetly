import 'package:budgetly/features/feature_main/presentation/components/bottom_app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget mainBottomAppBar({required List<Widget> tabs}) => BottomAppBar(
      height: 80,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: tabs,
      ),
    );
