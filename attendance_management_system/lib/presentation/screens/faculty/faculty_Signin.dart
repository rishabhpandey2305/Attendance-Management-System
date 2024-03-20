import 'package:attendance_management_system/presentation/resources/custom_button.dart';
import 'package:attendance_management_system/presentation/resources/custom_email.dart';
import 'package:attendance_management_system/presentation/resources/custom_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:attendance_management_system/presentation/screens/faculty/faculty_HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FacultyLogin extends StatefulWidget {
  const FacultyLogin({Key? key}) : super(key: key);

  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('http://192.168.235.183:3000/auth/login');
      final response = await http.post(
        url,
        body: json.encode({
          'username': _emailController.text,
          'password': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Login successful, save login state
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        // Navigate to home page
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const FacultyHomePage(),
        ));
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildemailfield(emailcontroller: _emailController),
            buildpasswordfield(passwordcontroller: _passwordController),
            defaultButton(onPress: _signIn, title: "SignIn")
          ],
        ),
      ),
    );
  }
}
