import 'package:flutter/material.dart';
import '../../account/account_list.dart';
import '../../app_bar.dart';
import '../../global_variables.dart';
import '/pages/page_identifier.dart';

class editProfilePage extends StatelessWidget {
  const editProfilePage({super.key});



  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController(text: GlobalVariables.curLoggedIn.name);
    TextEditingController highschoolController = TextEditingController(text: GlobalVariables.curLoggedIn.highschool);
    TextEditingController educationController = TextEditingController(text: GlobalVariables.curLoggedIn.education);
    TextEditingController cityController = TextEditingController(text: GlobalVariables.curLoggedIn.city);
    TextEditingController birthdateController = TextEditingController(text: GlobalVariables.curLoggedIn.birthdate);

    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const PageIdentifier("Ändra profil"),
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
                      TextField(
                        textAlign: TextAlign.center,
                        controller: nameController,
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
                                    TextField(
                                      decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 150, maxHeight: 10)),
                                      controller: highschoolController,
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
                                    TextField(
                                      decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 150, maxHeight: 10)),
                                      controller: educationController,
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
                                    TextField(
                                      decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 150, maxHeight: 10)),
                                      controller: cityController,
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
                                        Icons.person_sharp
                                    ),
                                    const SizedBox(width: 5),
                                    TextField(
                                      decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 150, maxHeight: 10)),
                                      controller: birthdateController,
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
        )
    );
  }
}