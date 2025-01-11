import 'package:timeboxing/models/task.dart';

class Priority {
  final String priorityIndex;
  final String priorityName;
  final String priorityDate;
  final List<Task> priorityTasks;

  Priority({
    required this.priorityIndex,
    required this.priorityName,
    required this.priorityDate,
    required this.priorityTasks,
  });

  factory Priority.fromJson(Map<String, dynamic> json) {
    return Priority(
      priorityIndex: json['priorityIndex'],
      priorityName: json['priorityName'],
      priorityDate: json['priorityDate'],
      priorityTasks: json['priorityTasks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'priorityIndex': priorityIndex,
      'priorityName': priorityName,
      'priorityDate': priorityDate,
      'priorityTasks': priorityTasks,
    };
  }
}
