import 'package:flutter/material.dart';
import 'post.dart';


class UniversityPost extends StatelessWidget {

  final Post post;
  const UniversityPost({super.key, required this.post });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.university,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "YoungSerif",
                    ),
                  ),
                  const SavedPost(),
                  CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/${post.imageName}"),
                      backgroundColor: Colors.transparent,
                  )
                ],
              ),
               Text(
                post.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "YoungSerif",
                ),
              ),
              Text(
                post.date,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "YoungSerif",
                ),
              ),
              Text(
                post.place,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: "YoungSerif",
                  fontWeight: FontWeight.w100
                ),
              ),
              const SizedBox(height: 10),
              Text(
                post.description,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: "YoungSerif",
                ),
              )
            ],
          ),
        )

    );
  }
}


class SavedPost extends StatefulWidget {
  const SavedPost({super.key});

  @override
  State<SavedPost> createState() => _SavedPostState();
}

class _SavedPostState extends State<SavedPost> {
  Color markColor = Colors.grey;

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: const Icon(Icons.bookmark),
      color: markColor,
      onPressed: () {
        if (markColor == Colors.grey){
          setState(() {
            markColor = Colors.black;
          });
        }
        else {
          setState(() {
            markColor = Colors.grey;
          });
        }

      },
    );
  }
}