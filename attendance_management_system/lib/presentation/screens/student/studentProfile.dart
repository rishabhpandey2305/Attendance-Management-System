import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class studentProfile extends StatefulWidget {
  const studentProfile({super.key});

  @override
  State<studentProfile> createState() => _studentProfileState();
}

class _studentProfileState extends State<studentProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _enNo = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _batch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
            profileDetails(
                title: "Enrollment Number",
                value: _enNo.text,
                controller: _enNo),
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
    required,
    required this.value,
    required this.controller,
  }) : super(key: key);
  final String title;
  final String value;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 10),
      // width: MediaQuery.of(context).size.width / 2,
      child: Expanded(
        child: Row(children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Widget.icon),
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
                          _showEditDialog(context, title, controller);
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
      ),
    );
  }
}

void _showEditDialog(
    BuildContext context, String title, TextEditingController controller) {
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
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}
