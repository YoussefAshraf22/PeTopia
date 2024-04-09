import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/Authentication/login.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/pages/home_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#00347D")),
        useMaterial3: true,
      ),

      //add routing routes for navigation pages
      routes: {
        //start with the home page
        '/': (context) => const HomePage(),

        // '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
