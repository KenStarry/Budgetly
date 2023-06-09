import 'package:budgetly/theme/my_colors.dart';
import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  final String pillTitle;
  final String amount;
  final Color color;
  final IconData icon;

  const IncomeCard(
      {Key? key,
      required this.pillTitle,
      required this.amount,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  pill title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.withOpacity(0.2)
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                pillTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),

        const SizedBox(height: 8,),
        
        //  pill amount
        Text(amount, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
