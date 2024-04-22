import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendList {
  String? text;
  IconData? icon;
  MaterialColor color;
  Function? onPressed;
  SendList({@required this.text, @required this.icon, required this.color,
  @required this.onPressed});
}
