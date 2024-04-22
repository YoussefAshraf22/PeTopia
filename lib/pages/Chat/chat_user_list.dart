import 'package:flutter/material.dart';
import 'package:zootopia/pages/Chat/chat_details_page.dart';

class ChatUserList extends StatefulWidget {
  String text;
  String? secondaryText;
  String image;
  String? time;
  ChatUserList(
      {super.key,
      required this.text,
      required this.secondaryText,
      required this.image,
      required this.time});

  @override
  State<ChatUserList> createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsPage(
                  name: widget.text,
                  image: widget.image,
                ),
              ));
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              maxRadius: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.text),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.secondaryText!,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.time!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
