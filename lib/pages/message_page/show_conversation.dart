import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/message_page/pop_up_message.dart';
import 'package:untitled/pages/message_page/request.dart';
import '/app_bar.dart';
import 'conversation_list.dart';
import 'message.dart';

class ShowConversation extends StatelessWidget {

  final Request request;
  //final Conversation conversation;
  const ShowConversation({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    Icon endChatIcon = const Icon(Icons.close);
    if (request.accepted) {
      endChatIcon = const Icon(Icons.check);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 50),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:AssetImage("images/${request.receiver.imageName}"),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 50,
                          child: IconButton(
                            onPressed: () {
                              print("nåt");
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpMessage(
                                        request: request,
                                      )
                              );
                            },
                            icon: endChatIcon,

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.call)
                            ],
                          ),
                        ),
                        Text(
                          request.receiver.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "YoungSerif",
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.more_vert_sharp),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: requestBox(context, endChatIcon),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomChatWidget(request: request),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     color: Colors.white.withOpacity(0.8),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       const Expanded(
                        //         child: TextField(
                        //           maxLines: 1,
                        //           decoration: InputDecoration(
                        //               border: InputBorder.none
                        //
                        //           ),
                        //         ),
                        //       ),
                        //       IconButton(
                        //         onPressed: () {},
                        //         icon: Icon(Icons.send),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  requestBox(context, endChatIcon) {
    String status = "Obesvarad";
    Color statusColor = Colors.orange;
    if (request.answered) {
      if (request.accepted) {
        status = "Accepterad";
        statusColor = Colors.green;
      }
      else {
        status = "Nekad";
        statusColor = Colors.red;
      }

    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Status:",
                style: TextStyle(
                  fontFamily: "YoungSerif"
                ),
              ),
              const SizedBox(width: 5),
              Text(
                status,
                style: TextStyle(
                    color: statusColor,
                    fontFamily: "YoungSerif"
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          const Text(
              "Dina frågor:",
            style: TextStyle(
                fontFamily: "YoungSerif"
            ),
          ),
          const SizedBox(height: 2),
          Text(
              request.message,
            style: const TextStyle(
                fontFamily: "SourceSerif",
                fontSize: 12
            ),
          ),
        ],
      ),
    );
  }
}


class CustomChatWidget extends StatefulWidget {
  const CustomChatWidget({super.key, required this.request});

  final Request request;


  @override
  State<CustomChatWidget> createState() => _customChatWidgetState();
}

class _customChatWidgetState extends State<CustomChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: Column(
            children: conversations[GlobalVariables.curLoggedIn.email]!
                .where((message) => message.student == widget.request.receiver)
                .map((message) => CustomMessageCard(message: message))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({super.key, required this.message});

  final Message message;



  @override
  Widget build(BuildContext context) {

    String imageLink = "profile.png";
    if (!message.accountSender) {
      imageLink = message.student.imageName;
    }

    Widget circleAvatar = CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: SizedBox(
            child: ClipOval(
              child: Image.asset("images/$imageLink",
              ),
            )
        )
    );

    Text messageText = Text(
      message.message,
      textAlign: TextAlign.start,
      maxLines: null,
      style: const TextStyle(
          fontFamily: "SourceSerif",
          fontSize: 12
      ),
    );

    if (!message.accountSender) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleAvatar,
          const SizedBox(width: 10),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.6),
                ),
              child: messageText,
            ),
          )
        ],

      );
    }

    return Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: messageText,
              ),
              const SizedBox(width: 10),
              circleAvatar,
            ],

          ),
        )

    );
  }
}

