import 'package:attendance_management_system/firebase_options.dart';
import 'package:attendance_management_system/presentation/resources/calendar.dart';
import 'package:attendance_management_system/presentation/resources/provider.dart';
import 'package:attendance_management_system/presentation/routes.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:attendance_management_system/presentation/screens/faculty/subject.dart';
import 'package:attendance_management_system/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const HomePage(),
      routes: routes,
    );
  }
}
