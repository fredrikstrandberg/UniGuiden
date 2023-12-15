import 'package:flutter/material.dart';
import 'university.dart';

class UniversityCard extends StatelessWidget {

  final University university;
  const UniversityCard({super.key, required this.university });

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 14,
                      fontFamily: "YoungSerif",
                      color: Colors.black54,
                    ),
                  ),
                  // Text(
                  //   university.description,
                  //   style: const TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: "YoungSerif",
                  //   ),
                  // ),
              ],
            ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(university.imagePath), // Använd NetworkImage
                backgroundColor: Colors.transparent,
              ),
          ]
        ),
      ),

    );
  }
}