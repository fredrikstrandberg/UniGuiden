import 'package:flutter/material.dart';
import 'package:untitled/account/handle_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'account.dart';
import 'account_list.dart';


CreateAccount(context, String email, password, name, birthdate, highschool, education, city) {

  email = email.toLowerCase();

  accountMap[email] = password;
  accountList.add(
      Account(
        email: email,
        password: password,
        name: name,
        birthdate: birthdate,
        highschool: highschool,
        education: education,
        city: city
      )
  );
  handleLogin(context, email, password);

  // Navigator.pushNamedAndRemoveUntil(context, "/main", (Route<dynamic> route) => false);
}

Future<void> createAccountAndLogin(
    BuildContext context,
    String email,
    String password,
    String name,
    String birthDate,
    String highschool,
    String education,
    String city,
    String accountType,

    ) async {
  await createAccount(context, email, password, name, birthDate, highschool, education, city, accountType);
  await handleLogin(context, email, password);
}

Future<void> createAccount(BuildContext context, String email, String password, String name, String birthdate, String highschool, String education, String city, String accountType) async {
  email = email.toLowerCase();

  // Skapa ett JSON-objekt med användarinformation
  final Map<String, dynamic> userData = {
    'email': email,
    'password': password,
    'name': name,
    'birthdate': birthdate,
    'highschool': highschool,
    'education': education,
    'city': city,
    'accountType': accountType,
  };
  //final url = Uri.http("10.0.2.2:3000", "/login");
  final url = Uri.parse('http://10.0.2.2:3000/addLogin'); //lägger till inlogg
  final response = await http.post(url,

  headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(userData),
  );
  if (response.statusCode == 200) {
    // Användaren har lagts till på servern, du kan göra något här om det behövs
    // handleLogin(context, email, password);
    print("ok status");

    await createProfile(context, userData); //lägger till användare med uppgifter
    return;
  } else {
    print("fel adduser");
    return;
    // Något gick fel vid förfrågan till servern, du kan hantera det här
  }
}

createProfile(BuildContext context, Map<String, dynamic> userData, ) async {
  //email = email.toLowerCase();

  // Skapa ett JSON-objekt med användarinformation
 /* final Map<String, dynamic> userData = {
    'email': email,
    'password': password,
    'name': name,
    'birthdate': birthdate,
  };*/
  //final url = Uri.http("10.0.2.2:3000", "/login");
  final url = Uri.parse('http://10.0.2.2:3000/addProfile');
  final response = await http.post(url,

    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(userData),
  );
  if (response.statusCode == 200) {
    // Användaren har lagts till på servern, du kan göra något här om det behövs
    // handleLogin(context, email, password);
    print("ok status");
  }else {
    print("fel addProfile");
    return;
    // Något gick fel vid förfrågan till servern, du kan hantera det här
  }
}