import 'package:flutter/material.dart';
import 'package:untitled/account/handle_login.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import 'package:untitled/pages/message_page/sent_requests_list.dart';
import '../pages/home_page/my_universities_list.dart';
import 'account.dart';
import 'account_list.dart';


CreateAccount(context, String email, password, name, birthdate, highschool, education, city, description) {

  email = email.toLowerCase();

  accountMap[email] = password;
  accountSavedUniversities[email] = [];
  accountSavedPosts[email] = [];
  accountSentRequests[email] = [];
  accountList.add(
      Account(
        email: email,
        password: password,
        name: name,
        birthdate: birthdate,
        highschool: highschool,
        education: education,
        city: city,
        description: description,
      )
  );
  HandleLogin(context, email, password);

  // Navigator.pushNamedAndRemoveUntil(context, "/main", (Route<dynamic> route) => false);
}
