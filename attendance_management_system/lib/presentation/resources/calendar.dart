import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendance.dart';

class DefaultCalendar extends StatelessWidget {
  final String subjectName;
  const DefaultCalendar({Key? key, required this.subjectName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Date'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // padding: EdgeInsets.all(16.0),
          child: CalendarWidget(
            onDateSelected: (selectedDate) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendanceScreen(
                      selectedDate: selectedDate,
                      subjectName: subjectName,
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const CalendarWidget({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();

    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
          width: 1000,
          child: Card(
            color: Colors.blue,
          ),
        ),
        TableCalendar(
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            // Customize header style here
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blue),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.blue),
            headerPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          calendarStyle: const CalendarStyle(
            // Customize calendar style here
            todayDecoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            todayTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            selectedDecoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            selectedTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            weekendTextStyle: TextStyle(color: Colors.red),
            outsideDaysVisible: false, // Hide days outside of the current month
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            // Customize days of week style here
            weekdayStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            weekendStyle:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              widget.onDateSelected(selectedDay);
            });
          },
        ),
      ],
    );
  }
}
