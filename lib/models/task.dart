import 'package:timeboxing/enums/task_status.dart';
import 'package:timeboxing/models/task_timebox_durations.dart';

class Task {
  String taskIndex;
  String taskId;
  String taskTitle;
  String taskDescription;
  TaskStatus taskStatus;
  List<TaskTimeBoxDuration> taskDurations;

  Task(
      {required this.taskIndex,
      required this.taskId,
      required this.taskTitle,
      required this.taskDescription,
      required this.taskStatus,
      required this.taskDurations});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskIndex: json['taskIndex'],
      taskId: json['taskId'],
      taskTitle: json['taskTitle'],
      taskDescription: json['taskDescription'],
      taskStatus: json['taskStatus'],
      taskDurations: json['taskDurations'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskIndex': taskIndex,
      'taskId': taskId,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'taskDurations': taskDurations,
    };
  }
}
