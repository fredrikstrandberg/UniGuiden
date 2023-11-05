import 'package:flutter/material.dart';
import 'package:untitled/pages/students_page/filter_popup.dart';
import 'package:untitled/pages/students_page/show_student.dart';
import '/pages/page_identifier.dart';
import 'student_list.dart';
import 'student_card.dart';
import 'package:filter_list/filter_list.dart';


class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController searchInputController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 100),
                const PageIdentifier("Studenter"),
                SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                              const filterPopUp()
                          );
                        },
                        icon: const Icon(Icons.filter_list),
                      ),
                      PopupMenuButton<TextButton>(
                        //offset: Offset(0,30),
                        icon: const Icon(Icons.search_outlined),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: searchInputController,
                                        maxLines: 1,
                                        cursorWidth: 200,
                                        decoration: const InputDecoration(
                                          hintText: "Sök här!"
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.search_outlined),
                                      onPressed: () {

                                      },
                                    )
                                  ],
                                )
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:
                    students.map((student)
                        => GestureDetector(
                        child: StudentCard(student: student),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowStudent(student: student),
                      ),
                    );
                  },
                )
                ).toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}