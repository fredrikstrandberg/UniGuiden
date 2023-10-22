import 'package:flutter/material.dart';
import 'package:untitled/pages/students_page/show_student.dart';
import '/pages/page_identifier.dart';
import 'student_list.dart';
import 'student_card.dart';
import 'package:filter_list/filter_list.dart';


class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 95),
                const PageIdentifier("Studenter"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),

              ],
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children:
            //         students.map((student)
            //            => GestureDetector(
            //            child: StudentCard(student: student),
            //       onTap: () {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => ShowStudent(student: student),
            //           ),
            //         );
            //       },
            //     )
            //     ).toList()),
            //   ),
            //),
          ],
        ),
      ),
    );
  }
}