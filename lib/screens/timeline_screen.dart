import 'package:flutter/material.dart';
import 'package:timeboxing/enums/task_status.dart';
import 'package:timeboxing/models/task.dart';
import 'package:timeboxing/widgets/custom_navigation_bar.dart';
import 'package:timeboxing/widgets/timeline.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    var events = [1, 2, 3, 4, 5];
    var timeLines = [];
    for (int i = 0; i < 5; i++) {
      var taskList = [];
      for (int j = 0; j < events[i]; j++) {
        taskList.add(Task(
          taskIndex: i.toString(),
          taskId: i.toString(),
          taskTitle: "Title $i",
          taskDescription: "Description of task $i",
          taskStatus: TaskStatus.inProgress,
          taskDurations: [],
        ));
      }
      timeLines.add(
        Timeline(
          isFirst: i == 0,
          isLast: i == events.length - 1,
          isPast: i < 2,
          gapHeightCurrent: i == 0 ? 100 : i * 100,
          gapHeightNext: (i + 1) * 100,
          tasks: [...taskList],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.abc_sharp),
            ),
            const Text("Scheduler"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        children: [...timeLines],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
