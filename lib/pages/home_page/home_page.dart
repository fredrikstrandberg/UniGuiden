import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/show_saved_posts.dart';
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Column(
          children: [
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
                          <Widget> [customPageIdentifier()] +
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
    );
  }

  customPageIdentifier() {
    return Row(
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
    );
  }
}


