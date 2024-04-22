import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:zootopia/pages/Chat/chat_details_page.dart';

class ChatMessages {
  String? message;
  MessageType? type;
  ChatMessages({@required this.message, @required this.type});
}
