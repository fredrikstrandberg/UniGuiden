import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page/post.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import 'package:untitled/pages/home_page/show_saved_posts.dart';
import '../../global_variables.dart';
import '../students_page/filter_popup.dart';
import '/pages/home_page/post_card.dart';
import '/pages/page_identifier.dart';
import 'my_universities_posts.dart';
import 'post_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<Post>> get posts async {
    final fetchedPosts = await fetchPosts();
    print("fetched posts");
    return fetchedPosts;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            customPageIdentifier(context),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: posts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('No data available');
                  } else {
                    final posts = snapshot.data!;
                    return RefreshIndicator(
                      onRefresh: () async {
                        final refreshedPosts = await fetchPosts();
                        // Handle the refreshed posts as needed
                        return Future.delayed(const Duration(seconds: 2));
                      },
                      backgroundColor: Colors.blue[900],
                      color: Colors.white,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: posts
                              .map((post) => UniversityPost(post: post))
                              .toList(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  customPageIdentifier(BuildContext context) {
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
                    builder: (BuildContext context) => const filterPopUp(),
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
