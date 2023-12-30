import 'package:flutter/material.dart';

class student_login extends StatefulWidget {
  const student_login({super.key});

  @override
  State<student_login> createState() => _student_loginState();
}

class _student_loginState extends State<student_login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: "Enter your Email Address"),
            ),
            TextFormField(
              controller: _passwordcontroller,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: "Enter your password"),
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint("email : ${_emailcontroller.text}");
                  debugPrint("password : ${_passwordcontroller.text}");
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
