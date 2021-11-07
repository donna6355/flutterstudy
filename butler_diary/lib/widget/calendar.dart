import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import '../model/diary.dart';
import '../widget/diary_card.dart';
import '../provider/my-selected-date.dart';

class Calendar extends StatelessWidget {
  final Map<String, List<Diary>> _events;
  final String masterId;
  final String masterName;
  Calendar(this._events, this.masterId, this.masterName);

  List<Diary> _getEventsForDay(DateTime day) {
    return _events[day.toString().substring(0, 10)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final CalendarFormat _calendarFormat =
        Provider.of<MySelectedDate>(context).getFormat;
    final DateTime _selected =
        Provider.of<MySelectedDate>(context).getSelectedDate;
    final DateTime _focused =
        Provider.of<MySelectedDate>(context).getFocusedDate;
    bool _checkDate(DateTime date) {
      if (date == _selected) return true;
      if (date.toString().substring(0, 10) ==
          _selected.toString().substring(0, 10)) return true;
      return false;
    }

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
            Provider.of<MySelectedDate>(context, listen: false)
                .updateSelectedDate(focusedDay, selectedDay);
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
            Provider.of<MySelectedDate>(context, listen: false).updateFormat();
          },
          child: Text(
              '${_calendarFormat == CalendarFormat.week ? '월간' : '주간'} 달력보기'),
        ),
        if (_getEventsForDay(_selected).isEmpty)
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
                      'master': masterName,
                      'key': masterId,
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
        if (_getEventsForDay(_selected).isNotEmpty)
          DiaryCard(_getEventsForDay(_selected)[0], masterId, masterName)
      ],
    );
  }
}
