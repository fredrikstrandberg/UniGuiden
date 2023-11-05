import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/my_universities_posts.dart';
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

  List fetchedPosts = posts;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  setState(() {
                    fetchedPosts = posts;
                  });
                  return Future.delayed(const Duration(seconds: 2));
                },
                //async => await Future.delayed(const Duration(seconds: 2)),
                backgroundColor: Colors.blue[900],
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Builder(
                    builder: (context) {
                      return Column(
                          children:
                          <Widget> [customPageIdentifier()] +
                          fetchedPosts.map((post) => UniversityPost(post: post)).toList(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyUniversitesPosts(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.school_outlined,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShowSavedPosts(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        const PageIdentifier("Flöde"),
        SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
                  Icons.filter_list,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


