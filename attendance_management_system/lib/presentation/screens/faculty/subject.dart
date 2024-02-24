import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:attendance_management_system/presentation/resources/custom_button.dart';
import 'package:attendance_management_system/presentation/resources/calendar.dart';

class subject extends StatelessWidget {
  const subject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Choose Subject",
          style: styles.pageHeading,
        ),
        backgroundColor: colors.blue,
      ),
      body: Column(children: [
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultButton(
                          onPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DefaultCalendar(
                                      subjectName: "INS")),
                            );
                          },
                          title: "INS")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultButton(
                          onPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DefaultCalendar(
                                      subjectName: "AWD")),
                            );
                          },
                          title: "AWD")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultButton(
                          onPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DefaultCalendar(
                                      subjectName: "IOT")),
                            );
                          },
                          title: "IOT")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultButton(
                          onPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DefaultCalendar(subjectName: "ML")),
                            );
                          },
                          title: "ML")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultButton(
                          onPress: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DefaultCalendar(
                                      subjectName: "SCPM")),
                            );
                          },
                          title: "SCPM")
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
