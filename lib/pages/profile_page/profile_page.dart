import 'package:flutter/material.dart';
import 'package:untitled/pages/profile_page/edit_profile_page.dart';
import '../../account/account_list.dart';
import '../../global_variables.dart';
import '/pages/page_identifier.dart';
import 'calculate_age.dart';

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
                      const PageIdentifier("Profil"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PopupMenuButton<TextButton>(
                            //offset: Offset(0,30),
                            icon: const Icon(Icons.settings),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => editProfilePage(),
                                          ),
                                        );
                                      },
                                      child: const Text("Redigera profil"),
                                    )
                                ),
                                PopupMenuItem(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                            "/login", (route) => false
                                        );
                                      },
                                      child: const Text("Logga ut"),
                                    )
                                ),
                              ];
                            },

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
                                Text(GlobalVariables.curLoggedIn.highschool,
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
                                Text(GlobalVariables.curLoggedIn.education,
                                  style: const TextStyle(
                                    fontFamily: "YoungSerif",
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                        const Flexible(child: SizedBox(width: 100)),
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
                                Text(GlobalVariables.curLoggedIn.city,
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
                                Text(
                                  "${calculateAge(
                                      GlobalVariables.curLoggedIn.birthdate
                                  )} år",
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
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Info om mig",
                              style: TextStyle(
                                fontFamily: "YoungSerif",
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            getDescriptionText(),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Text getDescriptionText() {
    String descriptionText;
    Color descriptionColor;
    if (GlobalVariables.curLoggedIn.description.isEmpty) {
      descriptionText = "Berätta om dig själv!";
      descriptionColor = Colors.black54;
    }
    else {
      descriptionText = GlobalVariables.curLoggedIn.description;
      descriptionColor = Colors.black;
    }
    return Text(
      descriptionText,
      style: TextStyle(
          fontFamily: "YoungSerif",
          fontSize: 12,
          color: descriptionColor,
      ),
    );
  }
}