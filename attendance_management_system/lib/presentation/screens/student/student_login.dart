import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';

late bool _passwordvisible;

class student_login extends StatefulWidget {
  const student_login({super.key});

  @override
  State<student_login> createState() => _student_loginState();
}

class _student_loginState extends State<student_login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
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
                        child: Column(
                      children: [
                        TextFormField(
                          controller: _emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Enter Your Email Address",
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colors.black)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        TextFormField(
                          obscureText: _passwordvisible,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                              hintText: "Enter your Password",
                              errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colors.black)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordvisible = !_passwordvisible;
                                  });
                                },
                                icon: Icon(_passwordvisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_off_outlined),
                                iconSize: 20,
                              )),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Signup"),)
                      ],
                    )),
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
