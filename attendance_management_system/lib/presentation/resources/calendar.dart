import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:attendance_management_system/presentation/screens/attendance/attendance.dart';

class DefaultCalendar extends StatelessWidget {
  final String subjectName;
  const DefaultCalendar({Key? key, required this.subjectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Date'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: CalendarWidget(
            onDateSelected: (selectedDate) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AttendanceScreen(selectedDate: selectedDate,subjectName: subjectName,
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
    return TableCalendar(
      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
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
          widget.onDateSelected(selectedDay); // update `_focusedDay` as well
        });
      },
    );
  }
}
