import 'package:flutter/material.dart';
import '/pages/page_identifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
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
            const Padding(
              padding: EdgeInsets.fromLTRB(10,30,10,0),
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("images/profile.png"),
                      backgroundColor: Colors.transparent,
                      ),
                  SizedBox(height: 10),
                  Text(
                    "Anders Andersson",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "YoungSerif",
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
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