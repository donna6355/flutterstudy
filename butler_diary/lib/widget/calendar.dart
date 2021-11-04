import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? _selected;
  DateTime _focused = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TableCalendar(
          firstDay: DateTime(2000),
          lastDay: DateTime(DateTime.now().year + 1),
          focusedDay: _focused,
          locale: 'ko_KR',
          selectedDayPredicate: (day) {
            return isSameDay(_selected, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selected = selectedDay;
              _focused = focusedDay; // update `_focusedDay` here as well
            });
          },
          calendarFormat: _calendarFormat,
          // onFormatChanged: (format) {
          //   if (_calendarFormat == format) return;
          //   setState(() {
          //     if (_calendarFormat == CalendarFormat.week)
          //       _calendarFormat = CalendarFormat.month;
          //     else if (_calendarFormat == CalendarFormat.month)
          //       _calendarFormat = CalendarFormat.week;
          //   });
          // },
          calendarStyle: CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: const Color(0xffa0a099),
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: const Color(0xff454442),
              shape: BoxShape.circle,
            ),
            selectedTextStyle: const TextStyle(
              color: const Color(0xFFFAFAFA),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // eventLoader: (day) {
          //   return _getEventsForDay(day);
          // },
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            //better to make custom formatbtn
            // formatButtonTextStyle: TextStyle(
            //   color: const Color(0xfffafafa),
            // ),
            // formatButtonDecoration: const BoxDecoration(
            //   color: const Color(0xffa0a099),
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(15),
            //   ),
            // ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (_calendarFormat == CalendarFormat.week)
                _calendarFormat = CalendarFormat.month;
              else if (_calendarFormat == CalendarFormat.month)
                _calendarFormat = CalendarFormat.week;
            });
          },
          child: Text(
              '${_calendarFormat == CalendarFormat.week ? '월간' : '주간'} 달력보기'),
        ),
      ],
    );
  }
}
