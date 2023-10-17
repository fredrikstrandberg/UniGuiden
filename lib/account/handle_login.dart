import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:untitled/pages/pop_up.dart';
import 'account.dart';
import 'account_list.dart';


HandleLogin(context, String email, String password) {

  if (accountMap[email] == password) {
    Navigator.pushReplacementNamed(context, "/main");
  }
  else {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            const AlertDialog(
              title: Text("Inloggning misslyckades!"
              ),
            ),
    );
  }
}