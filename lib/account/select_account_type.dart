import 'package:flutter/material.dart';
import 'package:untitled/account/setup_account.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';
import 'account_type_card.dart';
import 'account_types_list.dart';
import 'handle_login.dart';


class SelectAccountType extends StatelessWidget {
  SelectAccountType({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlueAccent,
                  Colors.deepOrange,
                ],
              )
          ),
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


