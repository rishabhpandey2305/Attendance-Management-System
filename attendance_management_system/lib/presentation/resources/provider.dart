import 'package:flutter/material.dart';

class StudentProfileData extends ChangeNotifier {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _enNo = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _batch = TextEditingController();

  void updateName(String newName) {
    _nameController.text = newName;
    notifyListeners();
  }
}
