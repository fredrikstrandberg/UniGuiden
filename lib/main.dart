import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '/pages/home_page/home_page.dart';
import '/pages/message_page/messages_page.dart';
import '/pages/profile_page/profile_page.dart';
import '/pages/students_page/students_page.dart';
import '/pages/universities_page/universities_page.dart';
import 'DB/users_database.dart';
import 'app_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Se till att Flutter-ramverket är initialiserat.
  final db = await UsersDatabase.instance.database;
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final Database db;

  MyApp({Key? key, required this.db}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    StudentsPage(),
    UniversitiesPage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
