import 'package:attendance_management_system/presentation/screens/faculty/faculty_Signin.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:attendance_management_system/presentation/screens/faculty/subject.dart';
import 'package:attendance_management_system/presentation/screens/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendance_check.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FacultyHomePage extends StatefulWidget {
  const FacultyHomePage({Key? key}) : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  late SharedPreferences _prefs;
  final _secureStorage = FlutterSecureStorage();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    _prefs = await SharedPreferences.getInstance();
    final isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      // If not logged in, navigate to login page
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }

  Future<void> _logout() async {
    await _prefs.setBool('isLoggedIn', false);
    setState(() {
      _isLoggedIn = false;
    });
    // Navigate to home page after logout
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Faculty",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 5),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 16),
                ),
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
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          _logout();
                        },
                        child: Text("Logout"),
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
                              const Text(
                                "Attendance",
                                style: TextStyle(fontSize: 16),
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
                            const Text(
                              "Time Table",
                              style: TextStyle(fontSize: 16),
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
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_outlined),
              title: const Text('Attendance Check'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AttendanceCheck())),
            ),
          ],
        ),
      );
}
