import 'package:flutter/material.dart';
import 'package:untitled/pages/message_page/request.dart';
import '../students_page/student.dart';

class PopUpMessage extends StatefulWidget {
  const PopUpMessage({super.key, required this.request });

  final Request request;

  @override
  State<PopUpMessage> createState() => _PopUpMessageState();
}

class _PopUpMessageState extends State<PopUpMessage> {

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text("Kunde ${widget.request.receiver.name} svara på frågorna du ställde innan?"),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontFamily: "YoungSerif",
        fontSize: 15,
        color: Colors.black,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                textAlign: TextAlign.start,
                widget.request.message,
                style: const TextStyle(
                  fontFamily: "SourceSerif",
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            "Ge ${widget.request.receiver.name} ett omdöme:",
            style: const TextStyle(
              fontFamily: "SourceSerif",
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star_border),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Nej",
            style: TextStyle(
              fontFamily: "YoungSerif",
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Ja",
            style: TextStyle(
              fontFamily: "YoungSerif",
            ),
          ),
        ),
      ],
    );
  }
}
