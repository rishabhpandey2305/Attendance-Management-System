import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("College")],
        ),
      ),
    );
  }
}
