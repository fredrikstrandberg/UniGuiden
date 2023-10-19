import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/DB/accounts_database.dart';
import 'account_list.dart';
import 'handle_login.dart';


CheckAccount(context, email, password, repeatPassword) async {
  bool validEmail = EmailValidator.validate(email);
  bool passInput = password.toString().isNotEmpty;
  bool repeatPassInput = repeatPassword.toString().isNotEmpty;
  List regEmails = accountMap.keys.toList();
  // bool passLengthCheck = (password.toString().length >= 8);

  if (!validEmail || !passInput || !repeatPassInput) {
    if (!validEmail) {
      return handleLoginError(context, "Fyll i en giltig email");
    }
    else {
      if (!passInput) {
        return handleLoginError(context, "Fyll i lösenord");
      }
      else {
        return handleLoginError(context, "Upprepa lösenord");
      }
    }
  }
  else {
    // if (regEmails.contains(email)) {
    //   return handleLoginError(context, "Email är redan registrerad");
    // }
    // else if (password != repeatPassword) {
    //   return handleLoginError(context, "Lösenorden stämmer inte överens");
    // }
    // else {
    //   return true;
    // }

    if (!await okEmail(email)){
      print("email ej registrerad");
      return handleLoginError(context, "Email är inte registrerad");
    }
    else if (password != repeatPassword) {
      return handleLoginError(context, "Lösenorden stämmer inte överens");
    }
    else {
      return true;
    }
  }
}


Future <bool> okEmail(email) async {
  print("inside okEmail");
  return await AccountDatabase.instance.okEmail(email);
}
