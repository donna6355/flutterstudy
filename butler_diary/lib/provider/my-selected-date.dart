import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MySelectedDate extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime get getSelectedDate => _selectedDate;
  DateTime get getFocusedDate => _focusedDate;
  CalendarFormat get getFormat => _calendarFormat;

  void moveToPrevDate() {
    _selectedDate = _selectedDate.subtract(Duration(days: 1));
    _focusedDate = _focusedDate.subtract(Duration(days: 1));
    notifyListeners();
  }

  void moveToNextDate() {
    _selectedDate = _selectedDate.add(Duration(days: 1));
    _focusedDate = _focusedDate.add(Duration(days: 1));
    notifyListeners();
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
