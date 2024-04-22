import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:zootopia/models/chat_messages.dart';
import 'package:zootopia/pages/Chat/chat_bubble.dart';

import '../../models/send_list.dart';
import 'chat_app_bar.dart';

enum MessageType {
  Sender,
  Receiver,
}

class ChatDetailsPage extends StatefulWidget {
  String name;
  String image;
  ChatDetailsPage({super.key, required this.name, required this.image});

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  List<ChatMessages> chatMessage = [
    ChatMessages(message: "Hi John ❤", type: MessageType.Receiver),
    ChatMessages(
        message: "Hope you are doing good", type: MessageType.Receiver),
    ChatMessages(
        message: "Hello Jane, I'm good what about you😀",
        type: MessageType.Sender),
    ChatMessages(
        message: "I'm fine, Working from home😥", type: MessageType.Receiver),
    ChatMessages(
        message: "Oh! Nice. Same here man 👏", type: MessageType.Sender),
    ChatMessages(
        message: "I need some, Can you help me?", type: MessageType.Receiver),
    ChatMessages(
        message: "Anytime I'm with you just call me",
        type: MessageType.Receiver),
    ChatMessages(message: "Yes, sure, I will ☺ ", type: MessageType.Sender),
    ChatMessages(message: "Thank you 🙌", type: MessageType.Receiver),
  ];

  List<SendList> sendList = [
    SendList(text: "Photos & Videos", icon: Icons.image, color: Colors.amber),
    SendList(
        text: "Document", icon: Icons.insert_drive_file, color: Colors.blue),
    SendList(text: "Audio", icon: Icons.music_note, color: Colors.orange),
    SendList(text: "Location", icon: Icons.location_on, color: Colors.green),
    SendList(text: "Contact", icon: Icons.person, color: Colors.purple),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        image: widget.image,
        name: widget.name,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  chatMessage.length,
                  (index) => ChatBubble(
                    chatMessage: chatMessage[index],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showModal();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: HexColor("#00347D"),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 21,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 50,
                    width: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(250, 192, 113, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {
                        // Add the typed message to the chatMessage list
                        setState(() {
                          chatMessage.add(ChatMessages(
                              message: _textController.text,
                              type: MessageType.Sender));
                          _textController.clear(); // Clear the text field
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          color: const Color(0xff737373),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    height: 4,
                    width: 50,
                    color: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: sendList[index].color.shade200,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 50,
                          width: 50,
                          child: Icon(
                            sendList[index].icon,
                            size: 20,
                            color: sendList[index].color.shade500,
                          ),
                        ),
                        title: Text(sendList[index].text!),
                      ),
                    );
                  },
                  itemCount: sendList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
