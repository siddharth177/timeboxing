import 'package:flutter/material.dart';
import 'package:timeboxing/models/task.dart';

class EventCard extends StatefulWidget {
  final List<Task> tasks;
  final double height;
  const EventCard({super.key, required this.tasks, required this.height});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black,
          // separate radius needed to merge continuous events spreading across different timeslots
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Text(
          "${widget.tasks[0].taskTitle}\nheight: ${widget.height}",
          style: const TextStyle(color: Colors.white),
        ));
  }
}
