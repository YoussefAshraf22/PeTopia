import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Zootopia',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: HexColor("#00347D")),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey[200], // Gray color
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0), // Adjust padding
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ), // Add search icon
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
