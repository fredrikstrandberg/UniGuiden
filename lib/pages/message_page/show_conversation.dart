import 'package:flutter/material.dart';
import '../pop_up.dart';
import 'conversation.dart';
import '/app_bar.dart';

class ShowConversation extends StatelessWidget {

  //final Conversation conversation;
  const ShowConversation({super.key}); //, required this.conversation });

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

