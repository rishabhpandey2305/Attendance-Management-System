import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfileData extends ChangeNotifier {
  TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  StudentProfileData() {
    // Load the name when the class is instantiated
    loadName();
  }

  Future<void> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name') ?? '';
  }

  void updateName(String newName) {
    _nameController.text = newName;
    _saveName(newName);
    notifyListeners();
  }

  Future<void> _saveName(String newName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', newName);
  }
}
