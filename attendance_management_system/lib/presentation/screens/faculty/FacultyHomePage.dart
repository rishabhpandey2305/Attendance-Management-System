import 'package:attendance_management_system/presentation/screens/faculty/FacultySignin.dart';
import 'package:attendance_management_system/presentation/screens/faculty/subject.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendanceCheck.dart';

class FacultyHomePage extends StatelessWidget {
  const FacultyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: styles.pageHeading,
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
            width: 1000,
            child: Card(
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              color: const Color(0xFF3498db),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                assets.attendace,
                                height: 80,
                                width: 40,
                              ),
                              Text(
                                "Attendance",
                                style: styles.regularText,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const subject())),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3498db),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              assets.class_T,
                              height: 80,
                              width: 40,
                            ),
                            Text(
                              "Time Table",
                              style: styles.regularText,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildHeader(context),
                buildMenuItems(context)
              ]),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined),
              title: const Text('Login'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FacultyLogin())),
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_outlined),
              title: const Text('Attencance Check'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AttendanceCheck())),
            ),
          ],
        ),
      );
}
