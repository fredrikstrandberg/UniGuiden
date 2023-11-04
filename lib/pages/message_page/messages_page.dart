import 'package:flutter/material.dart';
import 'package:untitled/pages/message_page/show_conversation.dart';
import '/pages/page_identifier.dart';
import 'message_card.dart';
import 'message_list.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PageIdentifier("Meddelanden"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children:
                      messages.map((message)
                      => GestureDetector(
                        child: MessageCard(message: message),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShowConversation(),
                            ),
                          );
                        },
                      )
                      ).toList()),
                ),
              ),

            ]
        ),
      ),
    );
  }
}