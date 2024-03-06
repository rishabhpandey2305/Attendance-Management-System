import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';

class buildemailfield extends StatelessWidget {
  const buildemailfield({
    super.key,
    required TextEditingController emailcontroller,
  }) : _emailcontroller = emailcontroller;

  final TextEditingController _emailcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _emailcontroller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Enter Your Email Address",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a email";
          } else if (!emailpatternfaculty.hasMatch(value)) {
            return "Please enter college email id";
          }
          return null;
        },
      ),
    );
  }
}
