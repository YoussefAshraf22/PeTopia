import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialBottons extends StatelessWidget {
  const SocialBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                (Bootstrap.facebook),
                size: 44,
                // color: Color.fromARGB(255, 58, 86, 247),
              )),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(
                (Bootstrap.google),
                size: 40,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
