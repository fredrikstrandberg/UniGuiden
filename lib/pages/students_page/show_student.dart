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
                                  title: "Skicka kontaktförfrågan till ${student.name}",
                                  acceptText: "Skicka",
                                  demandMessage: true,
                              )
                      );
                    },
                    icon: const Icon(Icons.person_add),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.school
                                  ),
                                  const SizedBox(width: 5),
                                  Text(student.university,
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                      Icons.my_library_books_rounded
                                  ),
                                  const SizedBox(width: 5),
                                  Text(student.program,
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                      Icons.leaderboard
                                  ),
                                  const SizedBox(width: 5),
                                  Text("År ${student.year}",
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const Flexible(child: SizedBox(width: 20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                      Icons.location_city
                                  ),
                                  const SizedBox(width: 5),
                                  Text(student.city,
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                      Icons.person_sharp
                                  ),
                                  const SizedBox(width: 5),
                                  Text("${student.age} år",
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Info om studenten",
                          style: TextStyle(
                            fontFamily: "YoungSerif",
                            fontSize: 20,
                          ),
                          ),
                        ],
                      ),

                    ),
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
