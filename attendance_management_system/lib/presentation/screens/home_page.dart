import 'package:attendance_management_system/presentation/screens/faculty/faculty_Signin.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendance_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: styles.pageHeading,
        ),
        centerTitle: true,

        // backgroundColor: Color.fromARGB(149, 243, 229, 33),
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
                            color: Colors.white,
                            // border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 2),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                assets.attendace,
                                // height: 100,
                                width: 80,
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
                                builder: (context) => const AttendanceCheck())),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.purple),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 2),
                                blurRadius: 7,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              assets.class_T,
                              // height: 80,
                              width: 80,
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
        elevation: 0,
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
              leading: Image.asset(
                assets.home,
                width: 40,
              ),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                assets.login,
                width: 40,
              ),
              title: const Text('Login'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FacultyLogin())),
            ),
            ListTile(
              leading: Image.asset(
                assets.attendace,
                width: 40,
              ),
              title: const Text('Attencance Check'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AttendanceCheck())),
            ),
          ],
        ),
      );
}
