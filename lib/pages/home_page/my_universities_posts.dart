import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/home_page/my_universities_list.dart';
import 'package:untitled/pages/home_page/post.dart';
import 'package:untitled/pages/home_page/post_card.dart';
import 'package:untitled/pages/home_page/post_list.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import '../page_identifier.dart';
import '../universities_page/university.dart';
import '../students_page/pop_up_contact_student.dart';
import '/app_bar.dart';

class MyUniversitesPosts extends StatelessWidget {

  //final Conversation conversation;
  const MyUniversitesPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightBlueAccent,
                Colors.deepOrange,
              ],
            )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PageIdentifier("Mina Universitet"),
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                      backgroundColor: Colors.blue[900],
                      color: Colors.white,
                      onRefresh: () async {
                        print("refreshing");
                        await Future.delayed(const Duration(seconds: 2));
                      },
                      child: const CustomScrollView()
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomScrollView extends StatefulWidget {
  const CustomScrollView({super.key});

  @override
  State<CustomScrollView> createState() => _CustomScrollViewState();
}

class _CustomScrollViewState extends State<CustomScrollView> {
  @override
  Widget build(BuildContext context) {
    List<String> ?savedUniversities = accountSavedUniversities[GlobalVariables.curLoggedIn.email];

    List<Post> savedUniversiteiesPosts = [];

    posts.forEach((Post post) {
      if (savedUniversities!.contains(post.university)) {
        savedUniversiteiesPosts.add(post);
      }
    });
    print(savedUniversiteiesPosts);


    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children:
        savedUniversiteiesPosts.map((post)
        => UniversityPost(post: post)).toList(),

      ),
    );
  }
}
