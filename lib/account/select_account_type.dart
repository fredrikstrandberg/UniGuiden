import 'package:flutter/material.dart';
import 'package:untitled/account/setup_account.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';
import 'account_type_card.dart';
import 'account_types_list.dart';


class SelectAccountType extends StatelessWidget {
  SelectAccountType({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const PageIdentifier("Skapa konto"),
                const SizedBox(height: 20),
                const Text(
                    "Välj det val som passar in bäst på dig:",
                    style: TextStyle(
                      fontFamily: "YoungSerif"
                    ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  accountTypeList.map((accountType)
                  => GestureDetector(
                    child: AccountTypeCard(accountType: accountType),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SetupAccount(),
                        ),
                      );
                    },
                  )
                  ).toList(),
                ),
              ],
            ),

          ),
        )
    );
  }
}


