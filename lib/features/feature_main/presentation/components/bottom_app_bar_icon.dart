import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomAppBarIcon(
        {required String title,
        required IconData icon,
        required bool isActive,
        required VoidCallback onTap}) =>
    InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? MyColors.lightColors['accent_4'] : Theme.of(Get.context!).iconTheme.color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
