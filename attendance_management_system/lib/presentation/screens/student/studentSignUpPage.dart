import 'package:attendance_management_system/presentation/resources/custom_button.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late bool _passwordvisible;

class student_logout extends StatefulWidget {
  const student_logout({super.key});

  @override
  State<student_logout> createState() => _student_loginState();
}

class _student_loginState extends State<student_logout> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _passwordvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3498db),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              Container(
                width: 385,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    color: Color(0xFF3498db),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      assets.student,
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello, Buddy",
                      style: styles.loginNameText,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Signin to Continue",
                      style: styles.regularText,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 385,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Form(
                            key: _signInKey,
                            child: Column(
                              children: [
                                buildemailfield(
                                    emailcontroller: _emailcontroller),
                                buildpasswordfield(
                                    passwordcontroller: _passwordcontroller),
                                defaultButton(
                                    onPress: () async {
                                      (_signInKey.currentState!.validate());
                                      {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: _emailcontroller.text,
                                                password:
                                                    _passwordcontroller.text);
                                      }
                                    },
                                    title: "Signup")
                              ],
                            )),
                      ],
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Already have an account? Signin here",
                    style: styles.shortBio,
                  )),
            ],
          )),
    );
  }
}

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
          } else if (!emailpatternstudent.hasMatch(value)) {
            return "Please enter college email id";
          }
          return null;
        },
      ),
    );
  }
}

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
