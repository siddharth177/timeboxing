import 'package:timeboxing/models/task_status.dart';
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
}
