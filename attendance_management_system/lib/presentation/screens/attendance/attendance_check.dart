import 'package:attendance_management_system/presentation/resources/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendanceCheck extends StatefulWidget {
  const AttendanceCheck({Key? key}) : super(key: key);

  @override
  State<AttendanceCheck> createState() => _AttendanceCheckState();
}

class _AttendanceCheckState extends State<AttendanceCheck> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String enrollmentNumber = '';
  String subjectName = '';
  double? attendancePercentage;
  int? totalPresent;
  int? totalAbsent;
  int? totalLectures;

  Future<void> _checkAttendance() async {
    // Validate the form before proceeding
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.get(Uri.parse(
            'http://192.168.1.11:3000/attendancePercentage/$enrollmentNumber/$subjectName'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final parsedAttendancePercentage = data['attendancePercentage'];
          final totalPresent = data['totalPresent'];
          final totalAbsent = data['totalAbsent'];
          final totalLectures = data['totalLectures'];
          if (parsedAttendancePercentage != null) {
            setState(() {
              attendancePercentage = parsedAttendancePercentage.toDouble();
              this.totalPresent = totalPresent;
              this.totalAbsent = totalAbsent;
              this.totalLectures = totalLectures;
            });
          } else {
            setState(() {
              attendancePercentage = null;
            });
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Attendance Check'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          enrollmentNumber = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter Enrollment Number",
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an Enrollment Number";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          subjectName = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter subject name",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a subject name";
                        }
                        return null;
                      },
                    ),
                  ),
                  defaultButton(
                      onPress: () {
                        _checkAttendance();
                      },
                      title: "Check Attendance"),
                  if (attendancePercentage != null)
                    Column(
                      children: [
                        Text(
                          'Your Attendance is : ${attendancePercentage?.toStringAsFixed(2)}%',
                        ),
                        Text(
                          'Total Present: $totalPresent',
                        ),
                        Text(
                          'Total Absent: $totalAbsent',
                        ),
                        Text(
                          'Total Lectures: $totalLectures',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
