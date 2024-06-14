import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/models/post_model.dart';
import 'package:zootopia/pages/Home/post_details.dart';
import 'package:zootopia/pages/Search/searchPage.dart';
import 'package:zootopia/shared/postContainer.dart';

List<PostModel> postModel = [];

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    postModel = [
      PostModel(
          userName: 'Dr.Hend',
          time: '2 Min ago',
          userImg: 'assets/images/woman2.png',
          content:
              'Let\'s celebrate the special bond we share with our pets! 🐾❤️ \n#PetLove #JoyfulCompanions',
          postImg: 'assets/images/Feed3.jpg',
          likes: 240,
          comments: 30),
      PostModel(
          userName: 'Youssef',
          time: '2 hours ago',
          userImg: 'assets/images/man2.png',
          content:
              'Life with pets is a joyous adventure filled with love and laughter. From the playful antics of a kitten to the loyal companionship of a dog, our furry friends bring boundless happiness into our lives every day ❤.',
          postImg: 'assets/images/Feed2.jpg',
          likes: 40,
          comments: 25),
      PostModel(
          userName: 'Zyad',
          time: ' Last Monday',
          content: '😛',
          userImg: 'assets/images/man.png',
          postImg: 'assets/images/Feed4.jpg',
          likes: 66,
          comments: 75),
      PostModel(
          userName: 'Saif',
          time: 'Yasterday',
          userImg: 'assets/images/man.png',
          content: 'What a cute pet 🥰',
          postImg: 'assets/images/Feed1.jpg',
          likes: 15,
          comments: 5),
      PostModel(
          userName: 'Omar',
          time: '5 hours ago',
          userImg: 'assets/images/man.png',
          content: 'I love pets, I will get one soon 🙈✨',
          likes: 8,
          comments: 2),
    ];
    void addNewPost(PostModel newPost) {
      setState(() {
        postModel.insert(
            0, newPost); // Insert new post at the beginning of the list
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        scrolledUnderElevation: 0,
        primary: false, //to remove the back arrow
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'PeTopia',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: HexColor("#00347D")),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ));
                },
                icon: const Icon(Icons.search),
                color: HexColor("#00347D")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostContainer(
              height: 160,
              onPost: addNewPost,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: postModel.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostDetails(
                  userName: postModel[index].userName,
                  userImg: postModel[index].userImg,
                  time: postModel[index].time,
                  postImg: postModel[index].postImg,
                  content: postModel[index].content,
                  likes: postModel[index].likes,
                  comments: postModel[index].comments,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
