import 'package:flutter/material.dart';
import 'package:untitled/account/handle_login.dart';
import 'account.dart';
import 'account_list.dart';


CreateAccount(context, email, password, name, birthdate) {


  accountMap[email] = password;
  accountList.add(
      Account(
        email: email,
        password: password,
        name: name,
        birthdate: birthdate,
      )
  );
  HandleLogin(context, email, password);

  // Navigator.pushNamedAndRemoveUntil(context, "/main", (Route<dynamic> route) => false);
}
