import 'package:timeboxing/models/task.dart';
import 'package:timeboxing/widgets/timeline.dart';

import '../enums/task_status.dart';

class TimelineService {
  List<Timeline> generateTimelineTasks() {
    var events = [1, 2, 3, 4, 5];
    List<Timeline> timeLines = [];
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
    return timeLines;
  }
}
