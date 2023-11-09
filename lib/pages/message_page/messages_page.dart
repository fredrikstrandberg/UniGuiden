import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/message_page/request.dart';
import 'package:untitled/pages/message_page/request_card.dart';
import 'package:untitled/pages/message_page/sent_requests_list.dart';
import 'package:untitled/pages/message_page/show_conversation.dart';
import '/pages/page_identifier.dart';


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
              const PageIdentifier("Kontakter"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children:
                      accountSentRequests[GlobalVariables.curLoggedIn.email]!.map((request)
                      => GestureDetector(
                        child: RequestCard(request: request),
                        onTap: () {
                          function();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ShowConversation(),
                            ),
                          );
                        },
                      )
                      ).toList()
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
  function() {
    List? accountSentRequestsList = accountSentRequests[GlobalVariables.curLoggedIn.email];

    if (accountSentRequestsList != null) {
      for (int i = 0; i < accountSentRequestsList.length; i++) {
        Request currentObject = accountSentRequestsList[i];
        print(currentObject.receiver.name);
        print(currentObject.time);
      }
      accountSentRequestsList.sort((a, b) => a.time.compareTo(b.time));
      for (int i = 0; i < accountSentRequestsList.length; i++) {
        Request currentObject = accountSentRequestsList[i];
        print(currentObject.receiver.name);
        print(currentObject.time);
      }
    }
  }
}

