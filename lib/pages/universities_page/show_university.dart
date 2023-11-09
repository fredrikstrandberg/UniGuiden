import 'package:flutter/material.dart';
import '../../global_variables.dart';
import '../home_page/my_universities_list.dart';
import 'pop_up_add_university.dart';
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
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
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
                  CustomIconButton(universityName: university.name),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(university.imagePath), // Använd NetworkImage
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


class CustomIconButton extends StatefulWidget {
  final String universityName;

  const CustomIconButton({Key? key, required this.universityName}) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {

  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    if(accountSavedUniversities[GlobalVariables.curLoggedIn.email]!.
    contains(widget.universityName)){
      isTrue = true;
    }

    return IconButton(
      iconSize: 50,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                PopUpUniversity(
                  university: widget.universityName,
                  addTrue: !isTrue,
                )
        );
      },
      icon: isTrue
          ? const Icon(Icons.remove_circle_outline) // Icon when isTrue is true
          : const Icon(Icons.add_circle_outline), // Icon when isTrue is false
    );
  }
}
