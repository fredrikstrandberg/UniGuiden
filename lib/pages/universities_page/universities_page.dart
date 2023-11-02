import 'package:flutter/material.dart';
import 'package:untitled/pages/universities_page/show_university.dart';
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
            const PageIdentifier("Universitet"),
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