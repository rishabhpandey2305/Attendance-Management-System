import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/screens/splash_screen.dart';
import 'package:attendance_management_system/presentation/screens/student/studentHomePage.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Student_Page.routeName: (context) => Student_Page(),
};
