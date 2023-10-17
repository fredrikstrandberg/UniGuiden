import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key, required this.title, required this.acceptText });

  final String title;
  final String acceptText;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontFamily: "YoungSerif",
        fontSize: 15,
        color: Colors.black,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Avbryt",
          style: TextStyle(
            fontFamily: "YoungSerif",
          )),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(acceptText,
            style: const TextStyle(
            fontFamily: "YoungSerif",
            )),
          ),
      ],

    );
  }
}