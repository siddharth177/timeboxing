import 'package:flutter/material.dart';
import 'package:timeboxing/services/timeline_service.dart';
import 'package:timeboxing/widgets/custom_navigation_bar.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  final TimelineService timelineService = TimelineService();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    // Handle FAB press here
    print('FAB Pressed!');
  }

  @override
  Widget build(BuildContext context) {
    var timelines = timelineService.generateTimelineTasks();
    var bottomNavigationBar = CustomNavigationBar(
      selectedIndex: _selectedIndex,
      onItemPressed: _onItemTapped,
      onFabPressed: _onFabPressed,
    );
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
        children: timelines,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: bottomNavigationBar.buildFab(),
      floatingActionButtonLocation: bottomNavigationBar.fabLocation,
    );
  }
}
