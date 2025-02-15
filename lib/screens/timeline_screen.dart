import 'package:flutter/material.dart';
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
        children: const [
          // more task above --> more height
          Timeline(isFirst: true, isLast: false, isPast: true, gapHeight: 50),
          Timeline(isFirst: false, isLast: false, isPast: true, gapHeight: 50),
          Timeline(isFirst: false, isLast: false, isPast: true, gapHeight: 200),
          Timeline(isFirst: false, isLast: true, isPast: false, gapHeight: 400),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
