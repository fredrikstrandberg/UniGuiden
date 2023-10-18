import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'account_list.dart';
import 'handle_login.dart';


CheckAccount(context, email, password, repeatPassword) {
  bool validEmail = EmailValidator.validate(email);
  bool passInput = password.toString().isNotEmpty;
  bool repeatPassInput = repeatPassword.toString().isNotEmpty;
  List regEmails = accountMap.keys.toList();
  // bool passLengthCheck = (password.toString().length >= 8);

  if (!validEmail || !passInput || !repeatPassInput) {
    if (!validEmail) {
      return HandleLoginError(context, "Fyll i en giltig email");
    }
    else {
      if (!passInput) {
        return HandleLoginError(context, "Fyll i lösenord");
      }
      else {
        return HandleLoginError(context, "Upprepa lösenord");
      }
    }
  }
  else {
    if (regEmails.contains(email)) {
      return HandleLoginError(context, "Email är redan registrerad");
    }
    else if (password != repeatPassword) {
      return HandleLoginError(context, "Lösenorden stämmer inte överens");
    }
    else {
      return true;
    }
  }
}
