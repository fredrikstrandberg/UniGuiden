import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/account/check_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/account/user.dart';




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
    if (!await checkEmailExist(email)){
      print("email ej registrerad");
      return handleLoginError(context, "Email är inte registrerad");
    }

    else if (await authenticateUser(email, password)) {
      print("correct");

      Navigator.pushReplacementNamed(context, "/main");
    }
    else{
      print("incorrect");

      return handleLoginError(context, "Felaktigt lösenord");
    }
  }
}

Future<bool> authenticateUser(String email, String password) async {
  final url = Uri.parse('http://10.0.2.2:3000/login');

  try {
    final response = await http.post(
      url,
      body: json.encode({'email': email, 'password': password}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final success = data['success'];
      final token = data['token'];
      final role = data["role"];
      final userInfoJson = data["user"];

      // Konvertera JSON till ett Map-objekt
      Map<String, dynamic> userInfo = json.decode(userInfoJson);

      print(token);
      print(userInfo);
      print(role);


      saveTokenLocally(token, userInfo, role);

      if (success == true) {
        print('Inloggning lyckades');
        return true;
      } else {
        print('Inloggning misslyckades, fel lösen');
        return false;
      }
    } else {
      print('Inloggning misslyckades');
      return false;
    }
  } catch (error) {
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
  return false;
}

void saveTokenLocally(String token, Map<String, dynamic> user, role) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
  prefs.setString('userId', user['id'].toString());
  prefs.setString('userEmail', user['email']);
  prefs.setString('userName', user['name']);

  // Beroende på användarroll, spara relevanta attribut

  if (role == 'highschool') {
    prefs.setString('userBirthdate', user['birthdate']);
    prefs.setString('userHighschool', user['highschool']);
    prefs.setString('userEducation', user['education']);
    prefs.setString('userCity', user['city']);
  } else if (role == 'university') {
    prefs.setString('userAge', user['age'].toString());
    prefs.setString('userUniversityID', user['universityID']);
    prefs.setString('userProgramID', user['programID']);
    prefs.setString('userYear', user['year'].toString());
    prefs.setString('userCity', user['city']);
  } else if (role == 'admin') {
    prefs.setString('userAdminRole', user['adminRole']);
  }

  // ... (sparar andra användarattribut beroende på behov)
}
