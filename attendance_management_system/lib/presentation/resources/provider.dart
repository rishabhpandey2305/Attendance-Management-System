import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfileData extends ChangeNotifier {
  StudentProfileData() {
    
    loadName();
  }

  TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

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
