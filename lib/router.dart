import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account/userProvider.dart';
import '/pages/home_page/home_page.dart';
import '/pages/message_page/messages_page.dart';
import '/pages/profile_page/profile_page.dart';
import '/pages/students_page/students_page.dart';
import '/pages/universities_page/universities_page.dart';
import 'login.dart';
import 'main.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      // Add other providers if needed
    ],
    child: MaterialApp(
      initialRoute: '/login',
      routes: {
        '/main': (context) => const MainScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/message': (context) => const MessagePage(),
        '/profile': (context) => const ProfilePage(),
        '/students': (context) => const StudentsPage(),
        '/universities': (context) => const UniversitiesPage(),
      },
    ),
  ),
);
