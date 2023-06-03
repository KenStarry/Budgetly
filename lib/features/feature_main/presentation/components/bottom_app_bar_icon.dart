import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomAppBarIcon({required String title, required IconData icon}) =>
    Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Theme.of(Get.context!).iconTheme.color,
            )),
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.bodySmall,
        )
      ],
    );
