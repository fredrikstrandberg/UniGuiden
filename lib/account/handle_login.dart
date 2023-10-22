import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled/account/check_account.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/pop_up.dart';
import '../DB/accounts_database.dart';
import '../model/account.dart';
import 'account_list.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/global_variables.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



handleLogin(context, email, password) async {

  email = email.toLowerCase();
  bool validEmail = EmailValidator.validate(email);
  bool passInput = password.toString().isNotEmpty;

  if (!validEmail || !passInput) {
    if (!validEmail) {
      return handleLoginError(context, "Fyll i en giltig email");
    }
    else {
      return handleLoginError(context, "Fyll i lösenord");
    }
  }

  // om ifyllda
  // else {
  //   // kolla att email registrerad
  //   if (accountMap[email] == null) {
  //     return HandleLoginError(context, "Email är inte registrerad");
  //   }
  //   // om registrered
  //   else {
  //     // kolla att lösenord stämmer
  //     if (accountMap[email] == password) {
  //       Navigator.pushReplacementNamed(context, "/main");
  //     }
  //     else {
  //       return HandleLoginError(context, "Felaktigt lösenord");
  //     }
  //   }
  // }
  else {
    // kolla att email registrerad
    if (!await emailExists(email)){
      print("email ej registrerad");
      return handleLoginError(context, "Email är inte registrerad");
    }

    if (await authenticateUser(email, password)) {
      print("correct");

      Navigator.pushReplacementNamed(context, "/main");
    }
    else{
      print("incorrect");

      return handleLoginError(context, "Felaktigt lösenord");
    }
  }
}

Future <bool> emailExists(email) async {
  print("inside okUser");
  return await AccountDatabase.instance.emailExists(email);
}

Future <bool> correctLogin(email, password) async{
  print("inside correctLogin");

  return await AccountDatabase.instance.correctLogin(email, password);
}
Future<bool> authenticateUser(String email, String password) async {
  final url = Uri.parse('http://localhost:3000/login'); // Byt ut detta med din serverens URL.

  try {
    final response = await http.post(
      url,
      body: json.encode({'email': email, 'password': password}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Inloggning lyckades
      print('Inloggning lyckades');
      return false;
    } else {
      // Inloggning misslyckades
      print('Inloggning misslyckades');
      return true;
    }
  } catch (error) {
    // Något gick fel
    print('Något gick fel: $error');
    return false;

  }
}





handleLoginError(context, errorString) {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
    AlertDialog(
      title: Text(
          errorString,
      ),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontFamily: "YoungSerif",
        fontSize: 15,
        color: Colors.black,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Ok",
              style: TextStyle(
              fontFamily: "YoungSerif"
              ),
            ),
        )
      ],
    ),
  );
}