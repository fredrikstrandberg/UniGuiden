import 'package:flutter/material.dart';
import '/pages/home_page/home_page.dart';
import '/pages/message_page/messages_page.dart';
import '/pages/profile_page/profile_page.dart';
import '/pages/students_page/students_page.dart';
import '/pages/universities_page/universities_page.dart';
import 'app_bar.dart';
import 'global_variables.dart' as globals;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const StudentsPage(),
    const UniversitiesPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        selectedItemColor: Colors.blue[900],
        showSelectedLabels: false,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Hem",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Studenter",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Universitet",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Meddelanden",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
          ),
        ],
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
        },
      ),
      body: widgetOptions.elementAt(curIndex),
    );
  }
}

