import 'package:flutter/material.dart';
import '../pop_up.dart';
import 'student.dart';
import '/app_bar.dart';


class ShowStudent extends StatelessWidget {

  final Student student;
  const ShowStudent({super.key, required this.student });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 50,
                  // color: Colors.blue[900],
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            PopUp(
                                title: "Skicka kontaktförfrågan till ${student.name}",
                                acceptText: "Skicka")
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:AssetImage("images/${student.imageName}"),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Vänster"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Höger"),
                        ],
                      )

                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
