import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/Authentication/login.dart';
import 'package:zootopia/pages/Authentication/register_page.dart';
import 'package:zootopia/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  final pages = [
    const Center(
      child: Text('Home'),
    ),
    const Login(),
    const RegisterPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      // //   title: const Text('Zootopia'),
      // // ),
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Color.fromRGBO(254, 169, 40, 0.13),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Color.fromRGBO(250, 192, 113, 1),
        height: 60,
        selectedIndex: selected,
        onDestinationSelected: (selected) {
          setState(() {
            this.selected = selected;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(
              applyTextScaling: false,
              fill: 0,
              Icons.home_filled,
              color: HexColor("#00347D"),
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Store',
            selectedIcon: Icon(
              Icons.shopping_cart_rounded,
              color: HexColor("#00347D"),
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
            selectedIcon: Icon(
              Icons.chat_rounded,
              color: HexColor("#00347D"),
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
            selectedIcon: Icon(
              Icons.person_3_rounded,
              color: HexColor("#00347D"),
            ),
          ),
        ],
      ),
    ));
  }
}
