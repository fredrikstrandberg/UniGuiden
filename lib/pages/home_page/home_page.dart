import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import 'package:untitled/pages/home_page/show_saved_posts.dart';
import '../../global_variables.dart';
import '/pages/home_page/post_card.dart';
import '/pages/page_identifier.dart';
import 'post_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/linedpaper.png"),
          fit: BoxFit.cover
        )

      ),
      child: Center(
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
                child: RefreshIndicator(
                  onRefresh: ()
                  async => await Future.delayed(const Duration(seconds: 2)),
                  backgroundColor: Colors.blue[900],
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Builder(
                      builder: (context) {
                        return Column(
                            children:
                            posts.map((post) => UniversityPost(post: post)).toList(),
                        );
                      }
                    ),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


