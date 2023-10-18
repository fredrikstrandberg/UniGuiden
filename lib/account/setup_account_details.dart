import 'package:flutter/material.dart';
import 'package:untitled/account/select_account_type.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';
import 'check_account.dart';


class SetupAccountDetails extends StatelessWidget {
  SetupAccountDetails({super.key});

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
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Namn',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ålder',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Namn',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          if (CheckAccount(
                            context,
                            emailController.text,
                            passwordController.text,
                            repeatPasswordController.text,
                          ) != null){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectAccountType(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: "YoungSerif"),
                            backgroundColor: Colors.blue[900]),
                        child: const Text("Skapa konto")
                    ),
                  ],
                ),
              ],
            ),

          ),
        )
    );
  }
}



