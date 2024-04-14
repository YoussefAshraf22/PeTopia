import 'package:flutter/material.dart';

class ProfileState extends ChangeNotifier {
  String _name = 'Youusef';
  String _email = 'ussef@gmail.com';

  String get name => _name;
  String get email => _email;

  void updateProfile({required String newName, required String newEmail}) {
    _name = newName;
    _email = newEmail;
    notifyListeners();
  }
}
