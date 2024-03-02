import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:attendance_management_system/presentation/screens/faculty/faculty_HomePage.dart';

class FacultyLogin extends StatefulWidget {
  const FacultyLogin({Key? key}) : super(key: key);

  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    final url = Uri.parse('http://192.168.17.183:3000/auth/login');
    final response = await http.post(
      url,
      body: json.encode({
        'username': _emailController.text,
        'password': _passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Login successful, navigate to home page
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const FacultyHomePage(),
      ));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
