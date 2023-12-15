import 'package:flutter/material.dart';
import 'package:untitled/global_variables.dart';
import 'package:untitled/pages/home_page/post_card.dart';
import 'package:untitled/pages/home_page/saved_posts_list.dart';
import '../page_identifier.dart';
import '/app_bar.dart';

class ShowSavedPosts extends StatefulWidget {

  //final Conversation conversation;
  const ShowSavedPosts({super.key});

  @override
  State<ShowSavedPosts> createState() => _ShowSavedPostsState();
}

class _ShowSavedPostsState extends State<ShowSavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
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
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageIdentifier("Sparade inlägg"),
                    ],
                  ),
                  Expanded(
                    child: CustomScrollView()
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
    return RefreshIndicator(
        backgroundColor: Colors.blue[900],
        color: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
          },
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children:
        accountSavedPosts[GlobalVariables.curLoggedIn.email]!.map((post)
        => UniversityPost(key: UniqueKey(), post: post)).toList(),
      ),
    ),
    );
  }
}
