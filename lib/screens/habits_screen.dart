import 'package:flutter/material.dart';
import 'package:timeboxing/widgets/custom_navigation_bar.dart';
import 'package:timeboxing/widgets/habits/mood_history.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MoodHistoryWidget(),
      ]),
      bottomNavigationBar: CustomNavigationBar.emptyConstructor(),
    );
  }
}
