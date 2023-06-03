import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomAppBarIcon(
        {required String title,
        required IconData icon,
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
              color: Theme.of(Get.context!).iconTheme.color,
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
