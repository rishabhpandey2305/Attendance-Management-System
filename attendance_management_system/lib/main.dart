import 'package:attendance_management_system/presentation/resources/provider.dart';
import 'package:attendance_management_system/presentation/routes.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:attendance_management_system/presentation/screens/student/studentHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentProfileData(),
      child: const MyApp(),
    ),
  );
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeResources(context);
    return MaterialApp(
      title: 'Attendance Management System',
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // initialRoute: Student_Page.routeName,
      home: const StudentPage(
        studentName: "",
      ),
      routes: routes,
    );
  }
}
