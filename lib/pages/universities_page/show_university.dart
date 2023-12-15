import 'package:flutter/material.dart';
import 'package:untitled/pages/universities_page/university_description.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
                    Text(
                      university.city,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "YoungSerif",
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      child: Text(
                          university.website,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontFamily: "YoungSerif"
                          )
                      ),
                      onPressed: () {
                        launchUrlString(university.website);
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 200,
                          maxHeight: 300,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: UniDescription(),
                          )
                        ),
                      ),
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
  UniDescription() {
    List<Widget> returnColumn = [];
    if (universityDescriptions.containsKey(university.name)) {
      for (var key in universityDescriptions[university.name]!.keys) {
        returnColumn.add(
            Text(
              key,
              style: const TextStyle(
                fontFamily: "YoungSerif",
                fontSize: 18,
              ),
            )
        );
        returnColumn.add(const SizedBox(height: 5));

        for (var val in universityDescriptions[university.name]![key]!) {
          returnColumn.add(
              Text(
                val,
                style: const TextStyle(
                  fontFamily: "SourceSerif",
                  fontSize: 12,
                  color: Colors.black87
                ),
              )
          );
        }
        returnColumn.add(const SizedBox(height: 20));
      }
      return returnColumn;
    }
    return [const Text("beskrivning")];
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
