import 'package:flutter/material.dart';
import 'package:timeboxing/models/task.dart';
import 'package:timeboxing/widgets/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final double gapHeightCurrent;
  final double gapHeightNext;
  final List<Task> tasks;
  const Timeline({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.gapHeightCurrent,
    required this.tasks,
    required this.gapHeightNext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gapHeightCurrent, // keep it variable to change the gap between
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: const LineStyle(color: Colors.black),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: Colors.blueAccent,
          iconStyle: IconStyle(
            iconData: Icons.dangerous_outlined,
            color: Colors.white,
          ),
        ),
        afterLineStyle: const LineStyle(color: Colors.red),
        endChild: isLast
            ? null
            : Transform.translate(
                offset: Offset(0, (gapHeightNext + gapHeightCurrent) / 4),
                child: EventCard(
                  tasks: tasks,
                  height: gapHeightNext,
                ),
              ),
      ),
    );
  }
}
