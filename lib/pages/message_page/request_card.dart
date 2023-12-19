import 'package:flutter/material.dart';
import 'package:untitled/pages/message_page/request.dart';
import 'package:intl/intl.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request});

  final Request request;


  @override
  Widget build(BuildContext context) {
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
                        child: Image.asset("images/${request.receiver.imagePath}",
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
                        Text(
                          request.receiver.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "YoungSerif",
                          ),
                        ),
                        Text(
                          DateFormat("E H:m").format(request.time),
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: "YoungSerif",
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 12,
                              fontFamily: "YoungSerif",
                              color: statusColor
                          )
                        ),
                        const SizedBox(height: 5),
                        Text(
                          maxLines: 1,
                          request.message,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "YoungSerif",
                              color: Colors.black54
                          ),
                        ),
                      ],
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
