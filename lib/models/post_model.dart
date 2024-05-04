import 'package:flutter/material.dart';

class PostModel {
  String userImg;
  String userName;
  String time;
  String? content;
  String? postImg;
  int likes;
  int comments;

  PostModel(
      {required this.userImg,
      required this.userName,
      required this.time,
      @required this.content,
      @required this.postImg,
      required this.likes,
      required this.comments});
}
