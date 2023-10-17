import 'package:flutter/material.dart';
import '/pages/pop_up.dart';
import '/app_bar.dart';

class CreateAccountPage extends StatelessWidget {

  //final Conversation conversation;
  const CreateAccountPage({super.key});

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

