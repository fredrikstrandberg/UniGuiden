import 'package:flutter/material.dart';
import '/app_bar.dart';

class ShowSavedPosts extends StatelessWidget {

  //final Conversation conversation;
  const ShowSavedPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
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
                      PageIdentifier("Sparade inlägg"),
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
    print("rebuilding");
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children:
        accountSavedPosts[GlobalVariables.curLoggedIn.email]!.map((post)
        => UniversityPost(post: post)).toList(),

      ),
    );
  }
}
