import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/my_universities_posts.dart';
import 'package:untitled/pages/home_page/show_saved_posts.dart';
import '../students_page/filter_popup.dart';
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
            customPageIdentifier(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {});
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
                          posts.map((post) => UniversityPost(key: UniqueKey(), post: post)).toList(),
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                      const filterPopUp()
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


