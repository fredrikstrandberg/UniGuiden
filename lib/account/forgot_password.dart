import 'package:flutter/material.dart';
import '../pages/students_page/pop_up_contact_student.dart';
import '/app_bar.dart';

class ForgotPasswordPage extends StatelessWidget {

  //final Conversation conversation;
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Text(
            "To be done :)",
            style: TextStyle(
              fontFamily: "YoungSerif",
              fontSize: 40,
            ),
          ),
        )
    );
  }
}