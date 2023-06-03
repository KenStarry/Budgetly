import 'package:flutter/material.dart';

void showAccountsBottomSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (context) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              //  bottom sheet drag icon
              Container(
                width: 50,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade600
                ),
              ),
              //  add account logo

              Text(
                "Add Account",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    )));
