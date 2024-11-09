import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String get monthName => switch (month) {
        1 => "January",
        2 => "February",
        3 => "March",
        4 => "April",
        5 => "May",
        6 => "June",
        7 => "July",
        8 => "August",
        9 => "September",
        10 => "October",
        11 => "November",
        _ => "December",
      };

  ///ex: Monday, Tuesday etc.
  String get weekdayName => switch (weekday) {
        1 => 'Monday',
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
        5 => "Friday",
        6 => "Saturday",
        _ => 'Sunday',
      };

  //--------------------------------------------------------------------------------------------
  String get fromNow {
    // first check if date is today, tomorrow or yesterday
    DateTime today = DateUtils.dateOnly(DateTime.now());
    DateTime appointment = DateUtils.dateOnly(this);
    if (DateUtils.isSameDay(this, today)) {
      return "Today";
    } else if (DateUtils.isSameDay(this, today.add(const Duration(days: 1)))) {
      return "Tomorrow";
    } else if (DateUtils.isSameDay(
        this, today.subtract(const Duration(days: 1)))) {
      return "Yesterday";
    } else {
      //check if date is within this week
      DateTime startOfNextWeek =
          DateUtils.addDaysToDate(today, (7 - today.weekdayNumber) + 1);
      DateTime endOfLastWeek =
          today.subtract(Duration(days: today.weekdayNumber));
      if (appointment.isAfter(endOfLastWeek) && isBefore(today)) {
        return "Last $weekdayName";
      } else if (appointment.isAfter(today) && isBefore(startOfNextWeek)) {
        return "This $weekdayName";
      }
      // date is a number of weeks forward or backwards.
      DateTime startOfThisWeek =
          today.subtract(Duration(days: today.weekdayNumber - 1));
      DateTime starOfAppointmentWeek =
          appointment.subtract(Duration(days: weekdayNumber - 1));

      int weeks = startOfThisWeek.difference(starOfAppointmentWeek).inDays ~/ 7;

      if (weeks.abs() > 6) {
        return format("D, d M Y");
      }

      if (weeks.isNegative) {
        return "Next ${weeks.abs() == 1 ? "" : "${weeks.abs()} "}week${weeks.abs() > 1 ? "s" : ""} $weekdayName";
      } else {
        return "Last ${weeks.abs() == 1 ? "" : "${weeks.abs()} "}week${weeks.abs() > 1 ? "s" : ""} $weekdayName";
      }
    }
  }

  //--------------------------------------------------------------------------------------------
  ///sunday - 1
  ///saturday - 7
  int get weekdayNumber {
    int value = weekday + 1;
    if (value == 8) {
      return 1;
    }
    return value;
  }

  //--------------------------------------------------------------------------------------------
  /// Ads time to DateTime object
  DateTime addTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}
