import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key, required this.title, required this.acceptText, required this.demandMessage });

  final String title;
  final String acceptText;
  final bool demandMessage;


  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
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
      content: possibleTextField(),
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
            if (!widget.demandMessage){
              Navigator.pop(context);
            }
            else if (messageController.text.isNotEmpty) {
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

  possibleTextField() {
    if (widget.demandMessage) {
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
            hintText: "Beskriv kortfattat vilka frågor du vill ha svar på!",
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
    else {
      return Container(
        height: 0,
      );
    }
  }
}
