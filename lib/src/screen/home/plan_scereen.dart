import 'package:flutter/material.dart';
import 'package:inventory/src/widgets/app_background.dart';
import 'package:inventory/src/widgets/custom_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _onCalendarFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  DateTime _focusedDay = DateTime.now();

  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Plan', isBackButton: false),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Text('Month View'),
                TableCalendar(
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: true,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  onFormatChanged: _onCalendarFormatChanged,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.black),
                    weekendStyle: TextStyle(color: Colors.red),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
