import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import 'post.dart';


class UniversityPost extends StatelessWidget {

  final Post post;
  const UniversityPost({ super.key, required this.post });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
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
                  const Flexible(child: SizedBox(width: 1000)),
                  SavedPost(savedPost: post),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage:  NetworkImage(post.imageName),
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
  final Post savedPost;
  const SavedPost({super.key, required this.savedPost});


  @override
  State<SavedPost> createState() => _SavedPostState();
}

class _SavedPostState extends State<SavedPost> {
  Color markColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    Post savedPost = widget.savedPost;
    if(savedPost.saved){
      markColor = Colors.black;
    }

    return IconButton(
      icon: const Icon(Icons.bookmark),
      color: markColor,
      onPressed: () {
        if (markColor == Colors.grey){
          setState(() {
            markColor = Colors.black;
          });
          savedPost.saved = true;
          accountSavedPosts[GlobalVariables.curLoggedIn.email]?.add(savedPost);
        }
        else {
          setState(() {
            markColor = Colors.grey;
          });
          savedPost.saved = false;
          accountSavedPosts[GlobalVariables.curLoggedIn.email]?.remove(savedPost);
        }

      },
    );
  }
}