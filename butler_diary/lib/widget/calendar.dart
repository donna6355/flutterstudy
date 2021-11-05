import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/diary.dart';
import '../widget/diary_card.dart';

class Calendar extends StatefulWidget {
  final Map<String, List<Diary>> _events;
  final String masterId;
  final String masterName;
  Calendar(this._events, this.masterId, this.masterName);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selected = DateTime.now();
  DateTime _focused = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<String, List<Diary>> _events = {};
  List<Diary> _selectedEvents = [];

  List<Diary> _getEventsForDay(DateTime day) {
    return _events[day.toString().substring(0, 10)] ?? [];
  }

  bool _checkDate(DateTime date) {
    if (date == _selected) return true;
    if (date.toString().substring(0, 10) ==
        _selected.toString().substring(0, 10)) return true;
    return false;
  }

  @override
  void initState() {
    super.initState();
    if (widget._events.isNotEmpty)
      setState(() {
        _events = widget._events;
        _selectedEvents = _getEventsForDay(_selected);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TableCalendar(
          eventLoader: _getEventsForDay,
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
              _selectedEvents = _getEventsForDay(selectedDay);
            });
          },
          calendarFormat: _calendarFormat,
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
          daysOfWeekHeight: 20,
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (events.isNotEmpty)
                return _checkDate(date)
                    ? Opacity(
                        opacity: 0.5,
                        child: Image.asset('asset/icon/graydone.png'),
                      )
                    : Opacity(
                        opacity: 0.5,
                        child: Image.asset('asset/icon/done.png'),
                      );
            },
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
        if (_selectedEvents.isEmpty)
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 150,
                  child: Image.asset('asset/img/adorable.png'),
                ),
                Text(
                  '이 몸을 관찰하고 기록해라옹!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final Map<String, dynamic> args = {
                      'master': widget.masterName,
                      'key': widget.masterId,
                      'date': _selected.toString().substring(0, 10),
                    };
                    Navigator.of(context).pushNamed(
                      '/diary_edit',
                      arguments: args,
                    );
                  },
                  child: Text(
                    '일기 쓰기',
                  ),
                ),
              ],
            ),
          ),
        if (_selectedEvents.isNotEmpty)
          DiaryCard(_selectedEvents[0], widget.masterId, widget.masterName)
      ],
    );
  }
}



// TableCalendar(
//   eventLoader: _getEventsForDay,
//   firstDay: DateTime(2000),
//   lastDay: DateTime(DateTime.now().year + 1),
//   focusedDay: _focused,
//   locale: 'ko_KR',
//   selectedDayPredicate: (day) {
//     return isSameDay(_selected, day);
//   },
//   onDaySelected: (selectedDay, focusedDay) {
//     setState(() {
//       _selected = selectedDay;
//       _focused = focusedDay; // update `_focusedDay` here as well
//       _selectedEvents = _getEventsForDay(selectedDay);
//     });
//   },
//   calendarFormat: _calendarFormat,
//   calendarStyle: CalendarStyle(
//     todayDecoration: const BoxDecoration(
//       color: const Color(0xffa0a099),
//       shape: BoxShape.circle,
//     ),
//     selectedDecoration: const BoxDecoration(
//       color: const Color(0xff454442),
//       shape: BoxShape.circle,
//     ),
//     selectedTextStyle: const TextStyle(
//       color: const Color(0xFFFAFAFA),
//       fontSize: 15.0,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
//   daysOfWeekHeight: 20,
//   headerStyle: HeaderStyle(
//     titleCentered: true,
//     formatButtonVisible: true,
//     formatButtonTextStyle: TextStyle(
//       color: const Color(0xfffafafa),
//     ),
//     formatButtonDecoration: const BoxDecoration(
//       color: const Color(0xffa0a099),
//       borderRadius: BorderRadius.all(
//         Radius.circular(15),
//       ),
//     ),
//   ),
// ),