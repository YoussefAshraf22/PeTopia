import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/models/post_model.dart';
import 'package:zootopia/pages/Home/feed_page.dart';
import 'package:zootopia/shared/postContainer.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Post',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: HexColor("#00347D")),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PostContainer(
                onPost: addNewPost,
                height: size.height / 1.2,
              )
            ],
          ),
        ),
      ),
    );
  }

  void addNewPost(PostModel newPost) {
    setState(() {
      postModel.insert(
          0, newPost); // Insert new post at the beginning of the list
    });
  }
}
