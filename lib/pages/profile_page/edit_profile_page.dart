import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/image_picker.dart';
import 'package:untitled/pages/profile_page/submit_profile_edits.dart';
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
    TextEditingController infoController = TextEditingController(text: GlobalVariables.curLoggedIn.description);


    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      const PageIdentifier("Ändra Profil"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              //String imageLink =
                              submitProfileEdits(
                                  nameController.text,
                                  highschoolController.text,
                                  educationController.text,
                                  cityController.text,
                                  birthdateController.text,
                                  infoController.text,
                                  //TODO: new image link or file
                              );
                              Navigator.of(context).pop(context);
                            },
                            icon: const Icon(Icons.save_alt),
                          ),
                        ],
                      ),

                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,30,10,0),
                    child: Column(
                      children: [
                        const ImagePickerWidget(),
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
                              Container(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 150,
                                  ),
                                  child: TextField(
                                    controller: infoController,
                                    textAlign: TextAlign.start,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Fyll i info om dig här!",
                                      hintStyle: TextStyle(
                                        fontSize: 12
                                      )
                                    ),
                                    style: const TextStyle(
                                      fontFamily: "YoungSerif",
                                      fontSize: 15,
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

                ],
              ),
            ),
          ),
        )
    );
  }
}