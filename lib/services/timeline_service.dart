import 'package:flutter/cupertino.dart';
import 'package:timeboxing/models/task.dart';
import 'package:timeboxing/widgets/timeline.dart';

import '../enums/task_status.dart';

class TimelineService {
  late double baseHeight;

  TimelineService() {
    baseHeight = 100;
  }

  List<Row> generateTimelineTasks() {
    var events = [1, 2, 3, 4, 5];
    List<Row> timeLines = [];
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
        Row(
          children: [
            Expanded(
              flex: 0,
              child: SizedBox(
                width: 30,
                // padding: const EdgeInsets.all(10),
                child: Text("$i"),
              ),
            ),
            Expanded(
              child: Timeline(
                isFirst: i == 0,
                isLast: i == events.length - 1,
                isPast: i < 2,
                gapHeightCurrent: i == 0 ? baseHeight : i * baseHeight,
                gapHeightNext: (i + 1) * baseHeight,
                tasks: [...taskList],
              ),
            ),
          ],
        ),
      );
    }
    return timeLines;
  }
}
