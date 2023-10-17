import 'package:flutter/material.dart';
import 'university.dart';

class UniversityCard extends StatelessWidget {

  final University university;
  const UniversityCard({super.key, required this.university });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    university.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  Text(
                    university.city,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  Text(
                    university.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "YoungSerif",
                    ),
                  ),


              ],
            ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/${university.imageName}"),
                backgroundColor: Colors.transparent,
              ),
          ]
        ),
      ),

    );
  }
}