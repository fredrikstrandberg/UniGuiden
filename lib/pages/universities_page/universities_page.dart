import 'package:flutter/material.dart';
import 'package:untitled/pages/universities_page/show_university.dart';
import '../students_page/filter_popup.dart';
import '/pages/page_identifier.dart';
import 'university_card.dart';
import 'university_list.dart';
import 'university.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 100),
                const PageIdentifier("Universitet"),
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
                          }
                          , icon: const Icon(Icons.filter_list)),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children:
                    universities.map((university)
                    => GestureDetector(
                        child: UniversityCard(university: university),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShowUniversity(university: university),
                          ),
                        );
                      },
                    )
                    ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}