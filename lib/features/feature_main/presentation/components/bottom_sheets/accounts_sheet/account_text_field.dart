import 'package:budgetly/features/feature_main/presentation/controller/main_form_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../theme/my_colors.dart';

class AccountTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final Function(String text) onChanged;

  const AccountTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.isNumber = false,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                focusColor: Theme.of(context).primaryColor,
                border: InputBorder.none),
            cursorColor: Theme.of(context).primaryColor,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          ),
        ),
      ],
    );
  }
}
