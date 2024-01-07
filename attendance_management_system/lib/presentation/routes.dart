import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/screens/splash_screen.dart';
import 'package:attendance_management_system/presentation/screens/student/studentHomePage.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  StudentPage.routeName: (context) => const StudentPage(studentName: "Student",),
};
