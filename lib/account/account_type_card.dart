import 'package:flutter/material.dart';
import 'account_type.dart';


class AccountTypeCard extends StatelessWidget {

  final AccountType accountType;
  const AccountTypeCard({super.key, required this.accountType });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    accountType.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/${accountType.imageName}"),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ],
          ),
        )

    );
  }
}