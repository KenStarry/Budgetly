import 'package:flutter/material.dart';

void showHomeBottomSheet(BuildContext context) =>
    showModalBottomSheet(context: context, builder: (context) => const Column(
      children: [
        Text("Home Bottom Sheet")
      ],
    ));