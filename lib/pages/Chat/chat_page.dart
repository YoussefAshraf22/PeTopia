import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/pages/Chat/chat_user_list.dart';

import '../../models/chat_users.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: 'Youssef',
        secondaryText: 'Hello',
        image: 'assets/images/man.png',
        time: 'Now'),
    ChatUsers(
        text: 'Saif',
        secondaryText: 'How are you?',
        image: 'assets/images/man.png',
        time: '3:35 PM'),
    ChatUsers(
        text: 'Dr. Hend',
        secondaryText: 'How much this?',
        image: 'assets/images/woman.png',
        time: 'Yesterday'),
    ChatUsers(
        text: 'Sara',
        secondaryText: 'It\'s amazing',
        image: 'assets/images/woman.png',
        time: '3.22 AM'),
    ChatUsers(
        text: 'Zyad',
        secondaryText: 'It\'s amazing',
        image: 'assets/images/man.png',
        time: '3.22 AM'),
    ChatUsers(
        text: 'Omar',
        secondaryText: 'Great',
        image: 'assets/images/man.png',
        time: '5.33 PM'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chatting Room',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: HexColor("#00347D")),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(250, 192, 113, 1),
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'New',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => ChatUserList(
                    text: chatUsers[index].text!,
                    secondaryText: chatUsers[index].secondaryText,
                    image: chatUsers[index].image!,
                    time: chatUsers[index].time),
                itemCount: chatUsers.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
