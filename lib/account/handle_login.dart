import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled/pages/pop_up.dart';
import 'account.dart';
import 'account_list.dart';


HandleLogin(context, email, password) {

  if (accountMap[email] == password) {
    Navigator.pushReplacementNamed(context, "/main");
  }
  else if (accountMap[email] == null) {
    return HandleLoginError(context, "Email är inte registrerad");
  }
  else {
    return HandleLoginError(context, "Felaktigt lösenord");
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