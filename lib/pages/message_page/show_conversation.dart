import 'package:flutter/material.dart';
import '/app_bar.dart';

class ShowConversation extends StatelessWidget {

  //final Conversation conversation;
  const ShowConversation({super.key}); //, required this.conversation });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightBlueAccent,
                Colors.deepOrange,
              ],
            )
        ),
        child: const Center(
          child: Text(
            "To be done :)",
            style: TextStyle(
              fontFamily: "YoungSerif",
              fontSize: 40,
            ),
          ),
        ),
      )
    );
  }
}

