import 'package:flutter/material.dart';
import 'package:zootopia/pages/home_page.dart';
import 'package:zootopia/pages/Authentication/login.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zootopia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primarySwatch: Colors.blue),

      //add routing routes for navigation pages
      routes: {
        //start with the home page
        '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
        'login': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
