import 'package:flutter/material.dart';
import 'package:untitled/pages/students_page/student.dart';
import '../../global_variables.dart';
import '../message_page/request.dart';
import '../message_page/sent_requests_list.dart';

class PopUpStudent extends StatefulWidget {
  const PopUpStudent({super.key, required this.title, required this.acceptText, required this.receiver });

  final String title;
  final String acceptText;
  final Student receiver;


  @override
  State<PopUpStudent> createState() => _PopUpStudentState();
}

class _PopUpStudentState extends State<PopUpStudent> {
  Color hintColor = Colors.black54;
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(widget.title),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontFamily: "YoungSerif",
        fontSize: 15,
        color: Colors.black,
      ),
      content: customTextField(),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Avbryt",
            style: TextStyle(
              fontFamily: "YoungSerif",
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (messageController.text.isNotEmpty) {
              accountSentRequests[GlobalVariables.curLoggedIn.email]!.add(
                Request(
                  receiver: widget.receiver,
                  message: messageController.text,
                  time: DateTime.now(),
                  answered: false,
                  accepted: false,
                )
              );
              Navigator.pop(context);
              //TODO: här ska det skickas en request till unistudenten
              //TODO: tänker nån slags popup för att visa att förfrågningen skickats
              // print(messageController.text) ska skickas med i requesten
            } else {
              setState(() {
                hintColor = Colors.red.shade400;
              });
            }
          },
          child: Text(
            widget.acceptText,
            style: const TextStyle(
              fontFamily: "YoungSerif",
            ),
          ),
        ),
      ],
    );
  }

customTextField() {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: messageController,
        style: const TextStyle(
          fontSize: 12,
          fontFamily: "YoungSerif",
        ),
        maxLines: null,
        decoration: InputDecoration(
          hintMaxLines: null,
          hintText: "Vilka frågor du vill ha svar på?",
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 10,
          ),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
