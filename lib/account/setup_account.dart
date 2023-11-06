import 'package:flutter/material.dart';
import 'package:untitled/account/setup_account_details.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';
import 'check_account.dart';


class SetupAccount extends StatelessWidget {
  SetupAccount({super.key});

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
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Lösenord',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: repeatPasswordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Upprepa lösenord',
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
                                builder: (context) => SetupAccountDetails(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: "YoungSerif"),
                            backgroundColor: Colors.blue[900]),
                        child: const Text("Nästa")
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



