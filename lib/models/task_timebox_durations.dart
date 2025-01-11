class TaskTimeBoxDuration {
  final String startTime;
  final String endTime;
  final String duration;
  final bool remind;
  final String reminderTime;
  final String reminderSnoozeDuration;

  TaskTimeBoxDuration({
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.remind,
    required this.reminderTime,
    required this.reminderSnoozeDuration,
  });
}
