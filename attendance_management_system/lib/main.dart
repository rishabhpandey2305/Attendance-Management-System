import 'package:attendance_management_system/presentation/routes.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:attendance_management_system/presentation/screens/student/studentProfile.dart';
import 'package:attendance_management_system/presentation/screens/student/studentSignInPage.dart';
import 'package:attendance_management_system/presentation/screens/student/studentHomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeResources(context);
    return MaterialApp(
      title: 'Attendance Management System',
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // initialRoute: Student_Page.routeName,
      home: Student_Page(),
      routes: routes,
    );
  }
}
