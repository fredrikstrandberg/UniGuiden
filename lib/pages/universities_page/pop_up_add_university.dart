import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/my_universities_list.dart';

import '../../global_variables.dart';

class PopUpUniversity extends StatefulWidget {
  const PopUpUniversity({super.key, required this.addTrue, required this.university });

  final String university;
  final bool addTrue;


  @override
  State<PopUpUniversity> createState() => _PopUpUniversityState();
}

class _PopUpUniversityState extends State<PopUpUniversity> {

  @override
  Widget build(BuildContext context) {

    if (widget.addTrue) {
      return AlertDialog(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Vill du lägga till ${widget.university} till dina universitet?"),
        titleTextStyle: const TextStyle(
          letterSpacing: 1,
          fontFamily: "YoungSerif",
          fontSize: 15,
          color: Colors.black,
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
            onPressed: () {
              accountSavedUniversities[GlobalVariables.curLoggedIn.email]?.
              add(widget.university);
              Navigator.pop(context);
            },
            child: const Text(
              "Lägg till",
              style: TextStyle(
                fontFamily: "YoungSerif",
              ),
            ),
          ),
        ],
      );
    }
    else {
      return AlertDialog(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("Vill du ta bort ${widget.university} från dina universitet?"),
        titleTextStyle: const TextStyle(
          letterSpacing: 1,
          fontFamily: "YoungSerif",
          fontSize: 15,
          color: Colors.black,
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
            onPressed: () {
              accountSavedUniversities[GlobalVariables.curLoggedIn.email]?.
              remove(widget.university);
              Navigator.pop(context);
            },
            child: const Text(
              "Ta bort",
              style: TextStyle(
                fontFamily: "YoungSerif",
              ),
            ),
          ),
        ],
      );
    }
  }
}
