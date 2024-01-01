import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StudentProfileData extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController _enNo = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _batch = TextEditingController();

  void updateName(String newName) {
    nameController.text = newName;
    notifyListeners();
  }
}