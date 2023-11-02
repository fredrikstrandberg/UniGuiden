import 'package:flutter/material.dart';
import '../pop_up.dart';
import 'university.dart';
import '/app_bar.dart';


class ShowUniversity extends StatelessWidget {

  final University university;
  const ShowUniversity({super.key, required this.university });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
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
                              title: "Lägg till ${university.name} bland dina universitet",
                              acceptText: "Lägg till",
                              demandMessage: false,
                          )
                      );
                    },
                    icon: const Icon(Icons.add_home_rounded),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage:AssetImage("images/${university.imageName}"),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      university.name,
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
      ),
    );
  }
}
