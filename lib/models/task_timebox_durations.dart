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

  factory TaskTimeBoxDuration.fromJson(Map<String, dynamic> json) {
    return TaskTimeBoxDuration(
      startTime: json['startTime'],
      endTime: json['endTime'],
      duration: json['duration'],
      remind: json['remind'],
      reminderTime: json['reminderTime'],
      reminderSnoozeDuration: json['reminderSnoozeDuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'duration': duration,
      'remind': remind,
      'reminderTime': reminderTime,
      'reminderSnoozeDuration': reminderSnoozeDuration,
    };
  }
}
