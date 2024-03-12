import 'dart:convert';
import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttendanceScreen extends StatefulWidget {
  final DateTime selectedDate;
  final String subjectName;
  const AttendanceScreen(
      {Key? key, required this.selectedDate, required this.subjectName})
      : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String uri = "http://192.168.27.183:3000/attendance";

  Future<void> getRecord() async {
    try {
      var response = await http.get(Uri.parse(uri));
      print("Response status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body);

        print("Decoded Data: $decodedData");

        // Check if the response is a list
        List<Map<String, dynamic>> castedData =
            List<Map<String, dynamic>>.from(decodedData);

        print("Casted Data: $castedData");

        setState(() {
          enrollmentNumbers = castedData;
        });
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> insertRecord() async {
    try {
      List<Map<String, dynamic>> records = [];

      for (var enrollmentNumber in enrollmentNumbers) {
        int enNo = enrollmentNumber["en_no"];
        bool present = attendanceMap[enNo] ?? true;
        String attendance = present ? 'P' : 'A';

        records.add({
          'en_no': enNo,
          'attendance': attendance,
          'subject': widget.subjectName
        });
      }
      String formattedDate =
          "${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}";

      for (var record in records) {
        record['date'] = formattedDate;
      }

      // Show confirmation dialog
      bool confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content:
                const Text("Are you sure you want to save this attendance?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
            ],
          );
        },
      );

      if (!confirm) {
        // User canceled the confirmation
        return;
      }

      await http.post(
        Uri.parse(uri),
        body: jsonEncode({
          'records': records,
          'subjectName': widget.subjectName,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      // Display a SnackBar when attendance is recorded
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Attendance recorded'),
        ),
      );

      print('Attendance recorded successfully.');
      // Fetch the updated records after recording attendance
      getRecord();
    } catch (e) {
      print('Error recording attendance: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getRecord();
  }

  List<Map<String, dynamic>> enrollmentNumbers = [];
  Map<int, bool> attendanceMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance Dashboard',
          style: styles.pageHeading,
        ),
        centerTitle: true,
      ),
      body: enrollmentNumbers.isEmpty
          ? const Center(
              child: Text('No data available'),
            )
          : ListView.builder(
              itemCount: enrollmentNumbers.length,
              itemBuilder: (context, index) {
                int enrollmentNumber = enrollmentNumbers[index]["en_no"];
                bool present = attendanceMap[enrollmentNumber] ?? true;

                return ListTile(
                  title: Text('$enrollmentNumber'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        present ? 'Present' : 'Absent',
                        style: TextStyle(
                          color: present ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        value: present,
                        onChanged: (value) {
                          setState(() {
                            attendanceMap[enrollmentNumber] = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.red,
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertRecord();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
