import 'package:flutter/material.dart';
import 'package:untitled/pages/profile_page/edit_profile_page.dart';
import '../../account/account_list.dart';
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
                      const PageIdentifier("Profil"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => editProfilePage(),
                                ),
                              );
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
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
                      color: Colors.grey[300],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Info om mig",
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
    );
  }
}

calculateAge(birthdate) {
  DateTime currentDate = DateTime.now();
  DateTime birthDateFormatted = DateTime.parse(birthdate);
  int age = currentDate.year - birthDateFormatted.year;
  int month1 = currentDate.month;
  int month2 = birthDateFormatted.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDateFormatted.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}