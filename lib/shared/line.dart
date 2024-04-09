import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 2,
                  indent: 35,
                  thickness: 0.3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 2,
                  endIndent: 35,
                  thickness: 0.3,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
