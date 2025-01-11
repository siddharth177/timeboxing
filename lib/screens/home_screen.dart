import 'package:flutter/material.dart';
import 'package:timeboxing/widgets/custom_navigation_bar.dart';
import 'package:timeboxing/widgets/timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: const Timeline(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
