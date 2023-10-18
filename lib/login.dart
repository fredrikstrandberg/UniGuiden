import 'package:flutter/material.dart';
import 'package:untitled/account/create_account.dart';
import 'package:untitled/account/forgot_password.dart';

import 'DB/users_database.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text("UniGuiden"),
        titleTextStyle: const TextStyle(
            fontFamily: "YoungSerif",
            fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Image.asset("images/login.png", width: 300),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordController,
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
                      String username = usernameController.text;
                      String password = passwordController.text;
                      checkLogin(username, password);
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
                    Text("Har du inget konto?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreateAccountPage(),
                            ),
                          );
                        },
                        child: Text("Skapa konto")
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(String username, String password) async {
    // Lägg till ditt inloggningslogik här, använd 'username' och 'password'.
    // Exempelvis, använd ditt UsersDatabase för att kontrollera om användaren är giltig.
    bool isLoggedIn = await UsersDatabase.instance.checkLogin(username, password);

    if (isLoggedIn) {
      // Användaren är inloggad, navigera till huvudskärmen eller gör något annat.
      Navigator.pushReplacementNamed(context, "/main");
    } else {
      // Inloggningen misslyckades, visa ett meddelande eller utför en annan åtgärd.
      // Här kan du visa en felaktig inloggningsvarning.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Inloggning misslyckades"),
            content: Text("Felaktigt användarnamn eller lösenord."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Stäng"),
              ),
            ],
          );
        },
      );
    }
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
