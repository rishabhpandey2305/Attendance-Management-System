import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _enNo = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _batch = TextEditingController();

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
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
        const SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            profileDetails(
              title: "Name",
              value: _nameController.text,
              controller: _nameController,
              onSave: _saveData,
            ),
            profileDetails(
              title: "Enrollment Number",
              value: _enNo.text,
              controller: _enNo,
              onSave: _saveData,
            ),
            profileDetails(
              title: "Batch",
              value: _batch.text,
              controller: _batch,
              onSave: _saveData,
            ),
            profileDetails(
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

class profileDetails extends StatelessWidget {
  const profileDetails({
    Key? key,
    required this.title,
    required this.value,
    required this.controller,
    required this.onSave,
  }) : super(key: key);
  final String title;
  final String value;
  final TextEditingController controller;
  final VoidCallback onSave;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 10),
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
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Save the edited value
              saveCallback();
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}
