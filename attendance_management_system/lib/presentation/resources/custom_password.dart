import 'package:flutter/material.dart';

late bool _passwordvisible;

class buildpasswordfield extends StatefulWidget {
  const buildpasswordfield({
    super.key,
    required TextEditingController passwordcontroller,
  }) : _passwordcontroller = passwordcontroller;

  final TextEditingController _passwordcontroller;

  @override
  State<buildpasswordfield> createState() => _buildpasswordfieldState();
}

class _buildpasswordfieldState extends State<buildpasswordfield> {
  @override
  void initState() {
    super.initState();
    _passwordvisible = true;
  }

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
        obscureText: _passwordvisible,
        controller: widget._passwordcontroller,
        decoration: InputDecoration(
            hintText: "Enter your Password",
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordvisible = !_passwordvisible;
                });
              },
              icon: Icon(_passwordvisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_rounded),
              iconSize: 20,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a password";
          } else if (value.length < 8) {
            return "Password must be at least 8 characters";
          }
          return null;
        },
      ),
    );
  }
}
