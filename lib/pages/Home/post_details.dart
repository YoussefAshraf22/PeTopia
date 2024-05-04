import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/shared/postState.dart';

// ignore: must_be_immutable
class PostDetails extends StatelessWidget {
  String userImg;
  String userName;
  String time;
  String? content;
  String? postImg;
  int likes;
  int comments;
  PostDetails(
      {super.key,
      required this.userImg,
      required this.userName,
      required this.time,
      @required this.content,
      @required this.postImg,
      required this.likes,
      required this.comments});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: size.width, margin:
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: const Border.fromBorderSide(BorderSide(color: Colors.grey)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 15,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImg),
                  maxRadius: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: HexColor("#00347D"),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.blueGrey,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.94, // Set maximum width to screen width
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22),
              child: Text(
                content != null ? content! : '',
                softWrap: true, // Allow text to wrap to a new line
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: const EdgeInsets.all(14),
            height: postImg != null ? size.height * 0.4 : 0,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(
                        postImg != null ? postImg! : 'assets/images/empty.png'),
                    fit: BoxFit.cover)),
          ),
          PostState(context: context, numLikes: likes, numComments: comments)
        ],
      ),
    );
  }
}
