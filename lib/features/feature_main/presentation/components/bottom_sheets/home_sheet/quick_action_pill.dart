import 'package:flutter/material.dart';

class QuickActionPill extends StatelessWidget {
  final String pillTitle;
  final IconData pillIcon;
  final Color pillColor;
  final Function onTap;

  const QuickActionPill(
      {super.key,
      required this.pillTitle,
      required this.pillIcon,
      required this.pillColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: pillColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(pillIcon, size: 24, color: pillColor,),
          ),
        ),
        const SizedBox(height: 8,),
        Text(pillTitle, style: Theme.of(context).textTheme.bodySmall,)
      ],
    );
  }
}
