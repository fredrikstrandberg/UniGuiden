import 'package:flutter/material.dart';
import 'package:untitled/account/handle_login.dart';
import '../DB/accounts_database.dart';
import '../model/account.dart';
import 'account_list.dart';


createAccount(context, String email, password, name, birthdate) async {

  // email = email.toLowerCase();
  //
  // accountMap[email] = password;
  // accountList.add(
  //     Account(
  //       email: email,
  //       password: password,
  //       name: name,
  //       birthdate: birthdate,
  //     )
  // );
  // handleLogin(context, email, password);

  email = email.toLowerCase();

  //accountMap[email] = password;

  Account newAccount = Account(
    email: email,
    password: password,
    name: name,
    birthdate: birthdate,
  );
  await addAccount(newAccount);

  handleLogin(context, email, password);
  // Navigator.pushNamedAndRemoveUntil(context, "/main", (Route<dynamic> route) => false);
}


Future<Account> addAccount(Account account) async {
  print("inside adding account");
  return await AccountDatabase.instance.addAccount(account);
}