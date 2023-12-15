import 'package:flutter/material.dart';
import 'message.dart';
import 'package:intl/intl.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message});

  final Message message;


  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                      child: ClipOval(
                        child: Image.asset("images/profile.png",
                        ),
                      )
                  )
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "message.contact",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "YoungSerif",
                          ),
                        ),
                        Text(
                          DateFormat("E H:m").format(message.time),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: "YoungSerif",
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      message.message,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "YoungSerif",
                        color: Colors.black54

                      ),
                    ),
                  ],
                ),
              ),
            ],

          ),
        )

    );

  }
}
