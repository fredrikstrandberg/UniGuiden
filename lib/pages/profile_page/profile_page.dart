import 'package:flutter/material.dart';
import '../../global_variables.dart';
import '/pages/page_identifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      const PageIdentifier("Studenter"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            icon: const Icon(Icons.settings),
                          ),
                        ],
                      ),

                    ],
                  ),
                ]
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,30,10,0),
              child: Column(
                children: [
                  const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("images/profile.png"),
                      backgroundColor: Colors.transparent,
                      ),
                  const SizedBox(height: 10),
                  Text(
                    GlobalVariables.curLoggedIn.name,
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