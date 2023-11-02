import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/account/create_account.dart';
import 'package:untitled/account/select_account_type.dart';
import 'package:untitled/pages/page_identifier.dart';
import '/app_bar.dart';
import 'account.dart';
import 'check_account.dart';
import 'account_list.dart';


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
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const PageIdentifier("Skapa konto"),
                const SizedBox(height: 20),
                const Text(
                  "Välj det val som passar in bäst på dig:",
                  style: TextStyle(
                      fontFamily: "YoungSerif"
                  ),
                ),
                const SizedBox(height: 10),
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

                        //TBD: Lägga in datepicker

                        TextField(
                          controller: birthDateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Födelsedatum (ÅÅÅÅ-MM-DD)',
                          ),
                        ),
                        TextField(
                          controller: highschoolController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gymnasium',
                          ),
                        ),
                        TextField(
                          controller: educationController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Gymnasieutbildning',
                          ),
                        ),
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Stad/Ort',
                          ),
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              CreateAccount(
                                context,
                                email,
                                password,
                                nameController.text,
                                birthDateController.text,
                                highschoolController.text,
                                educationController.text,
                                cityController.text
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "YoungSerif"),
                                backgroundColor: Colors.blue[900]),
                            child: const Text("Skapa konto")
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


