class Reminder {
  final int id;
  final int hours;
  final int minutes;
  final List<int> daysOfWeek;
  final String info;

  Reminder(
      {required this.id,
      required this.hours,
      required this.minutes,
      required this.daysOfWeek,
      required this.info});
}
