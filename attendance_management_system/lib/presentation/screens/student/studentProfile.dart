// ignore_for_file: use_build_context_synchronously

import 'package:attendance_management_system/presentation/resources/provider.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final TextEditingController _batch = TextEditingController();
  final TextEditingController _enNo = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData(); // Load saved data when the widget is initialized
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _enNo.text = prefs.getString('En.No') ?? '';
      _phoneNumber.text = prefs.getString('phoneNo') ?? '';
      _batch.text = prefs.getString('batch') ?? '';
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('En.No', _enNo.text);
    prefs.setString('phoneNo', _phoneNumber.text);
    prefs.setString('batch', _batch.text);
    Provider.of<StudentProfileData>(context, listen: false)
        .updateName(_nameController.text);
    // Navigator.pop(context);

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => StudentPage(studentName: _nameController.text),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFF3498db),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        minRadius: 80.0,
                        maxRadius: 80.0,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(assets.profileimage),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Hey, ${_nameController.text}",
                        style: styles.regularText),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileDetails(
              title: "Name",
              value: _nameController.text,
              controller: _nameController,
              onSave: _saveData,
            ),
            ProfileDetails(
              title: "Enrollment Number",
              value: _enNo.text,
              controller: _enNo,
              onSave: _saveData,
            ),
            ProfileDetails(
              title: "Batch",
              value: _batch.text,
              controller: _batch,
              onSave: _saveData,
            ),
            ProfileDetails(
              title: "Phone Number",
              value: _phoneNumber.text,
              controller: _phoneNumber,
              onSave: _saveData,
            ),
          ],
        )
      ]),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.controller,
    required this.onSave,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onSave;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      // width: MediaQuery.of(context).size.width / 2,
      child: Row(children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: styles.regularTextblack,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    value,
                    style: styles.regularTextblack,
                  ),
                  IconButton(
                      onPressed: () {
                        _showEditDialog(context, title, controller, onSave);
                      },
                      icon: const Icon(Icons.edit_outlined)),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

void _showEditDialog(BuildContext context, String title,
    TextEditingController controller, VoidCallback saveCallback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit $title'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Enter new $title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Save the edited value
              saveCallback();
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
