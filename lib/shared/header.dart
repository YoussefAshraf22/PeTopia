import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  String? img;
  Header({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      //using mediaQuery to keeping widget up to date
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      // height: 320,
      decoration: const BoxDecoration(
          //to fill the container with many colors drown under the image
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            img!,
            fit: BoxFit.cover,
            width: 375,
            height: 180,
          ),
        )
      ]),
    );
  }
}
