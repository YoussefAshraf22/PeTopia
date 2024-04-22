import 'package:flutter/material.dart';

import '../../models/chat_messages.dart';
import 'chat_details_page.dart';

class ChatBubble extends StatefulWidget {
  ChatMessages? chatMessage;
  ChatBubble({super.key, @required this.chatMessage});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Wrap in SingleChildScrollView
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Align(
          alignment: (widget.chatMessage?.type == MessageType.Receiver
              ? Alignment.topLeft
              : Alignment.topRight),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (widget.chatMessage?.type == MessageType.Receiver
                  ? Colors.white
                  : Colors.grey.shade200),
            ),
            padding: const EdgeInsets.all(15),
            child: Text(widget.chatMessage!.message!),
          ),
        ),
      ),
    );
  }
}
