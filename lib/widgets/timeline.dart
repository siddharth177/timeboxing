import 'package:flutter/material.dart';
import 'package:timeboxing/models/task.dart';
import 'package:timeboxing/widgets/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final double gapHeight;
  final List<Task> tasks;
  const Timeline({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.gapHeight,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gapHeight, // keep it variable to change the gap between
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: const LineStyle(color: Colors.black, thickness: 4),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: Colors.blueAccent,
          iconStyle: IconStyle(
            iconData: Icons.dangerous_outlined,
            color: Colors.white,
          ),
        ),
        afterLineStyle: const LineStyle(
          color: Colors.red,
          thickness: 4,
        ),
        endChild: EventCard(tasks: tasks),
      ),
    );
  }
}
