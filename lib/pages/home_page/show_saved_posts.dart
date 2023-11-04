import 'package:flutter/material.dart';
import '/app_bar.dart';

class ShowSavedPosts extends StatelessWidget {

  //final Conversation conversation;
  const ShowSavedPosts({super.key});

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