import 'package:flutter/material.dart';
import 'package:mdaq/common/data/reminder.dart';
import 'package:mdaq/common/helper.dart';

Future<void> getReminder(BuildContext context, Function() refresh) async {
  reminder.clear();
  reminder.add(Reminder(
      id: 1,
      hours: 9,
      minutes: 30,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Ngaji"));
  reminder.add(Reminder(
      id: 1,
      hours: 21,
      minutes: 15,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Hafalan"));
  reminder.add(Reminder(
      id: 1,
      hours: 9,
      minutes: 30,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Ngaji"));
  reminder.add(Reminder(
      id: 1,
      hours: 21,
      minutes: 15,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Hafalan"));
        reminder.add(Reminder(
      id: 1,
      hours: 9,
      minutes: 30,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Ngaji"));
  reminder.add(Reminder(
      id: 1,
      hours: 21,
      minutes: 15,
      daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
      info: "Hafalan"));
}
