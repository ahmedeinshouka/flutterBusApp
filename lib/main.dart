import 'package:flutter/material.dart';
import 'package:untitled5/Screens/BusTimetable.dart';
import 'package:untitled5/Screens/HomePage.dart';
import 'package:untitled5/Screens/Splash.dart';
import 'package:untitled5/Screens/Intro.dart';
import 'package:untitled5/Screens/ShowMap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/Intro': (context) => const Intro(),
        '/Home': (context) => const Home(),
        '/BusTimetable': (context) => const BusTimetable(),
        '/showmap': (context) => const ShowMap(),
      },
    );
  }
}
