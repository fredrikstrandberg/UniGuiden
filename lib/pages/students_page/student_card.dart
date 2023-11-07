import 'package:flutter/material.dart';
import 'student.dart';

class StudentCard extends StatelessWidget {

  final Student student;
  const StudentCard({super.key, required this.student });

  @override
  Widget build(BuildContext context) {
    Color badgeColor = Colors.transparent;
    if (student.ambassador) {
      badgeColor = Colors.black;
    }
    return Card(
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "YoungSerif",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.badge_outlined,
                        color: badgeColor,
                      )
                    ],
                  ),
                  Text(
                    "Ålder: ${student.age}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  Text(
                    student.city,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    student.university,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  Text(
                    student.program,
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: "YoungSerif",
                        fontWeight: FontWeight.w100
                    ),
                  ),
                  Text(
                    "År ${student.year}",
                    style: const TextStyle(
                        fontSize: 10,
                        fontFamily: "YoungSerif",
                        fontWeight: FontWeight.w100
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                      child: ClipOval(
                        child: Image.asset("images/${student.imageName}",
                        ),
                      )
                  )
              )
            ],

          ),
        )

    );
  }
}