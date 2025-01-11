import 'package:intl/intl.dart';

List<String> kWeekDays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

List<String> kWeekDaysShort = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

DateTime dateNow() {
  return DateTime.now(); // Example output: 2025-01-11 15:34:22.123456
}

yearNow() {
  return dateNow().year;
}

monthNow() {
  return dateNow().month;
}

dayNow() {
  return dateNow().day.toString();
}

hourNow() {
  return dateNow().hour;
}

minuteNow() {
  return dateNow().minute;
}

secondNow() {
  return dateNow().second;
}

weekNumberNow() {
  return dateNow().weekday;
}

weekDayNow() {
  return kWeekDays[weekNumberNow() - 1];
}

weekDayShortNow() {
  return kWeekDaysShort[weekNumberNow() - 1];
}

currentCompleteDate({String formatter = 'yyyy-MM-dd'}) {
  return DateFormat(formatter).format(dateNow());
}
