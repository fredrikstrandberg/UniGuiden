import 'package:flutter/material.dart';
import 'package:untitled/account/forgot_password.dart';
import 'account/handle_login.dart';
import 'account/select_account_type.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Image.asset("images/uniGuiden3.png", width: 300),
                      const SizedBox(height: 40),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const KeepLoggedIn(),
                          const Text("Håll mig inloggad"),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text("Glömt lösenord")),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            handleLogin(context, emailController.text, passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: "YoungSerif"),
                              backgroundColor: Colors.blue[900]),
                          child: const Text("Logga in")
                      ),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Har du inget konto?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SelectAccountType(),
                                  ),
                                );
                              },
                              child: const Text("Skapa konto")
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class KeepLoggedIn extends StatefulWidget {
  const KeepLoggedIn({super.key});

  @override
  State<KeepLoggedIn> createState() => _KeepLoggedInState();
}

class _KeepLoggedInState extends State<KeepLoggedIn> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
