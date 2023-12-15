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
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PageIdentifier("Förfrågningar"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children:
                        returnChildren(context)
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
  sortListOnTime() {
    if (accountSentRequests[GlobalVariables.curLoggedIn.email] == null){
      return [];
    }
    List<Request>? accountSentRequestsList = accountSentRequests[GlobalVariables.curLoggedIn.email];
    accountSentRequestsList!.sort((a, b) => b.time.compareTo(a.time));
    return accountSentRequestsList;
  }

  returnChildren(context) {
    List sortedList = sortListOnTime();
    print(sortedList);

    return sortListOnTime()!.map<Widget>((request)
    => GestureDetector(
      child: RequestCard(request: request),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShowConversation(request: request),
          ),
        );
      },
    )
    ).toList();
  }
}

