import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/students_page/pop_up_contact_student.dart';
import 'account.dart';
import 'account_list.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/global_variables.dart';


HandleLogin(context, email, password) {

  email = email.toLowerCase();
  bool validEmail = EmailValidator.validate(email);
  bool passInput = password.toString().isNotEmpty;

  if (!validEmail || !passInput) {
    if (!validEmail) {
      return HandleLoginError(context, "Fyll i en giltig email");
    }
    else {
      return HandleLoginError(context, "Fyll i lösenord");
    }
  }

  // om ifyllda
  else {
    // kolla att email registrerad
    if (accountMap[email] == null) {
      return HandleLoginError(context, "Email är inte registrerad");
    }
    // om registrered
    else {
      // kolla att lösenord stämmer
      if (accountMap[email] == password) {
        GlobalVariables.curLoggedIn = accountList[accountList.indexWhere((account) => account.email == email)];
        Navigator.of(context).pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
      }
      else {
        return HandleLoginError(context, "Felaktigt lösenord");
      }
    }
  }
}

HandleLoginError(context, errorString) {
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