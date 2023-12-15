import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/account/create_account.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';


class SetupAccountDetails extends StatelessWidget {
  SetupAccountDetails({super.key, required this.email, required this.password});

  final String email;
  final String password;

  final nameController = TextEditingController();
  final birthDateController = TextEditingController();
  final highschoolController = TextEditingController();
  final educationController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
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
            child: Column(
              children: [
                const PageIdentifier("Skapa konto"),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Namn',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: birthDateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Födelsedatum (ÅÅÅÅ-MM-DD)',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: highschoolController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gymnasium',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: educationController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gymnasieutbildning',
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Stad/Ort',
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
/*                            onPressed: () {
                              CreateAccount(
                                context,
                                email,
                                password,
                                nameController.text,
                                birthDateController.text,
                                highschoolController.text,
                                educationController.text,
                                cityController.text,
                                "",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "YoungSerif"),
                                backgroundColor: Colors.blue[900]),
                            child: const Text("Skapa konto")*/
                            onPressed: () async {
                              await createAccountAndLogin(
                                  context,
                                  email,
                                  password,
                                  nameController.text,
                                  birthDateController.text,
                                  highschoolController.text,
                                  educationController.text,
                                  cityController.text,
                                  "highschool", //provisional for account type
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "YoungSerif"),
                                backgroundColor: Colors.blue[900]),
                            child: const Text("Skapa konto")
                          /*onPressed: () async {

                            await createAccountAndLogin(context, email, password, nameController.text, birthDateController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20, fontFamily: "YoungSerif"),
                            backgroundColor: Colors.blue[900],
                          ),
                          child: const Text("Skapa konto"),*/
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
        )
    );
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}


class _DatePickerState extends State<DatePicker> {

  DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      CupertinoDatePicker(
        initialDateTime: dateTime,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime chosenDate) {
          setState(() => dateTime = chosenDate);
    }
    );
  }
}


