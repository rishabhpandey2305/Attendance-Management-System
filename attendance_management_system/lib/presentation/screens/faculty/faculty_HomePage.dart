import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:attendance_management_system/presentation/screens/faculty/subject.dart';
import 'package:attendance_management_system/presentation/screens/home_page.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendance_check.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutUtility {
  static Future<void> logout(BuildContext context) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomePage(),
    ));
  }
}

class FacultyHomePage extends StatefulWidget {
  const FacultyHomePage({Key? key}) : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    _prefs = await SharedPreferences.getInstance();
    final isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      setState(() {});
    } else {
      // If not logged in, navigate to login page
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }

  Future<void> _logout() async {
    await LogoutUtility.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faculty",
          style: styles.pageHeading,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Row(
              children: [
                Image.asset(
                  assets.logout,
                  height: 35,
                  width: 50,
                ),
                const SizedBox(width: 5),
                // Text(
                //   'Logout',
                //   style: styles.regularText,
                // ),
              ],
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          LogoutUtility.logout(context);
                        },
                        child: const Text(
                          "Logout",
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
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
                                builder: (context) => const subject())),
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
  const NavigationDrawer({Key? key}) : super(key: key);

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
              leading: Image.asset(assets.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(assets.attendace),
              title: const Text('Attendance Check'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AttendanceCheck())),
            ),
            ListTile(
              leading: Image.asset(assets.logout),
              title: const Text('Logout'),
              onTap: () => {
                {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              LogoutUtility.logout(context);
                            },
                            child: const Text(
                              "Logout",
                            ),
                          ),
                        ],
                      );
                    },
                  )
                },
              },
            ),
          ],
        ),
      );
}
