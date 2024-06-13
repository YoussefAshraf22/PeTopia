import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.rotate(
        angle: pi / 4,
        child: Container(
          width: 45.0,
          height: 45.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: HexColor("#00347D"),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Transform.rotate(
            angle: pi / 4,
            child: child,
          ),
        ),
      ),
    );
  }
}
