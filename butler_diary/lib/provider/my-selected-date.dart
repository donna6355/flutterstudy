import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MySelectedDate extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime get getSelectedDate {
    return _selectedDate;
  }

  DateTime get getFocusedDate {
    return _focusedDate;
  }

  CalendarFormat get getFormat {
    return _calendarFormat;
  }

  void updateSelectedDate(DateTime focused, DateTime selected) {
    _selectedDate = selected;
    _focusedDate = focused;
    notifyListeners();
  }

  void resetFormat() {
    _calendarFormat = CalendarFormat.week;
    notifyListeners();
  }

  void updateFormat() {
    if (_calendarFormat == CalendarFormat.week)
      _calendarFormat = CalendarFormat.month;
    else if (_calendarFormat == CalendarFormat.month)
      _calendarFormat = CalendarFormat.week;
    notifyListeners();
  }
}
