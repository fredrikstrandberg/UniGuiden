import 'package:flutter/material.dart';

class filterPopUp extends StatelessWidget {
  const filterPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text("Filtrera studenter"),
      titleTextStyle: const TextStyle(
        letterSpacing: 1,
        fontFamily: "YoungSerif",
        fontSize: 15,
        color: Colors.black,
      ),
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Filter 1"),
          Text("Filter 2"),
          Text("Filter 3"),
        ],
      ),
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
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Filtrera",
            style: TextStyle(
              fontFamily: "YoungSerif",
            ),
          ),

        ),
      ],
    );
  }
}
