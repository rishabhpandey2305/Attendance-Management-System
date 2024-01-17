import 'package:attendance_management_system/presentation/resources/provider.dart';
import 'package:attendance_management_system/presentation/screens/student/studentProfile.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key, required this.studentName}) : super(key: key);

  static String routeName = 'Student_Page';

  final String studentName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Dashboard",
          style: styles.pageHeading,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
            width: 1000,
            child: Card(
              color: Colors.blue,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFF3498db),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            
            
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                          future: Provider.of<StudentProfileData>(context,
                                  listen: false)
                              .loadName(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Text(
                                'Hey, ${Provider.of<StudentProfileData>(context, listen: false).nameController.text}',
                                style: styles.regularText,
                              );
                            } else {
                              
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "6IT2 | En No: 101",
                          style: styles.regularText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "2021-2022",
                            style: styles.shortBio,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const StudentProfile()));
                      },
                      child: CircleAvatar(
                        minRadius: 80.0,
                        maxRadius: 80.0,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(assets.profileimage),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Attendance",
                            style: styles.description,
                          ),
                          Text(
                            "90%",
                            style: styles.description,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                              assets.notification,
                              height: 80,
                              width: 40,
                            ),
                            Text(
                              "Notifications",
                              style: styles.regularText,
                            )
                          ],
                        ),
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
                              assets.query,
                              height: 80,
                              width: 40,
                            ),
                            Text(
                              "Query",
                              style: styles.regularText,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3498db),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3498db),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3498db),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF3498db),
                            borderRadius: BorderRadius.circular(20)),
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
