import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/show_saved_posts.dart';
import '/pages/home_page/post_card.dart';
import '/pages/page_identifier.dart';
import 'post_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShowSavedPosts(),
                        ),
                      );
                    },
                    icon: const Icon(
                        Icons.bookmark,
                        size: 35,
                    ),
                ),
                const SizedBox(width: 117),
                const PageIdentifier("Flöde"),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:
                    posts.map((post) => UniversityPost(post: post)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


