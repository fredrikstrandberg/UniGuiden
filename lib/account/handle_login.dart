import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:untitled/account/check_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/account/user.dart';
import 'package:untitled/account/userProvider.dart';




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

    else if (await authenticateUser(context, email, password)) {
      print("correct");

      Navigator.pushReplacementNamed(context, "/main");
    }
    else{
      print("incorrect");

      return handleLoginError(context, "Felaktigt lösenord");
    }
  }
}

Future<bool> authenticateUser(BuildContext context, String email, String password) async {
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
      final role = data['role'];
      final userInfo = data['user'] as Map<String, dynamic>;

      if (role == null) {
        print('Användarroll saknas');
        // Handle the case where the 'role' is null (if needed)
        return false;
      }
      print(role);
      print('Role: $role');

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      print("provider klar");
      final loggedInUser = User.fromJson(userInfo, role: role);
      print("loggedInUser klar");

      userProvider.setLoggedInUser(loggedInUser);
      print("setLoggedInUser klar");

      print('Token: $token');
      print('UserInfo: $userInfo');
      print('Role: $role');

      saveTokenLocally(token, userInfo, role);

      if (success == true) {
        print('Inloggning lyckades');
        return true;
      } else {
        print('Inloggning misslyckades, fel lösen');
        return false;
      }
    } else {
      print('Inloggning misslyckades. Status code: ${response.statusCode}');
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


  // ... (sparar andra användarattribut beroende på behov)
}
