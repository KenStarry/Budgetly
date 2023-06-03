import 'package:flutter/material.dart';

void showCategoriesBottomSheet(BuildContext context) =>
    showModalBottomSheet(context: context, builder: (context) => const Column(
      children: [
        Text("Categories Bottom Sheet")
      ],
    ));