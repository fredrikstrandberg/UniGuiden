import 'package:flutter/material.dart';
import 'package:untitled/account/handle_login.dart';
import 'account.dart';
import 'account_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


/*CreateAccount(context, String email, password, name, birthdate) {

  email = email.toLowerCase();

  accountMap[email] = password;
  accountList.add(
      Account(
        email: email,
        password: password,
        name: name,
        birthdate: birthdate,
      )
  );
  handleLogin(context, email, password);

  // Navigator.pushNamedAndRemoveUntil(context, "/main", (Route<dynamic> route) => false);
}*/

import 'package:http/http.dart' as http;

Future<void> createAccount(BuildContext context, String email, String password, String name, String birthdate) async {
  email = email.toLowerCase();

  // Skapa ett JSON-objekt med användarinformation
  final Map<String, dynamic> userData = {
    'email': email,
    'password': password,
    'name': name,
    'birthdate': birthdate,
  };

  final response = await http.post(
    Uri.parse('https://example.com/api/addUser'), // Byt ut URL:en mot din serverens URL
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(userData),
  );

  if (response.statusCode == 200) {
    // Användaren har lagts till på servern, du kan göra något här om det behövs
    // handleLogin(context, email, password);
  } else {
    // Något gick fel vid förfrågan till servern, du kan hantera det här
  }
}

