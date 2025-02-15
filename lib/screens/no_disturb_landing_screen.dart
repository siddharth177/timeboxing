import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class NoDisturbLandingScreen extends StatefulWidget {
  const NoDisturbLandingScreen({super.key});

  @override
  _NoDisturbLandingScreenState createState() => _NoDisturbLandingScreenState();
}

class _NoDisturbLandingScreenState extends State<NoDisturbLandingScreen> {
  String taskStatus = "In Progress";
  late String currentTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    // Update time every second
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      currentTime = DateFormat('h:mm a').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  double _calculateProgress(String startTime, String endTime) {
    DateFormat format = DateFormat("h a");
    DateTime now = DateTime.now();

    DateTime start = format.parse(startTime);
    DateTime end = format.parse(endTime);

    start = DateTime(now.year, now.month, now.day, start.hour, 0);
    end = DateTime(now.year, now.month, now.day, end.hour, 0);

    double totalDuration = end.difference(start).inMinutes.toDouble();
    double elapsedDuration = now.difference(start).inMinutes.toDouble();

    if (elapsedDuration < 0) return 0;
    if (elapsedDuration > totalDuration) return 1;

    return elapsedDuration / totalDuration;
  }

  @override
  Widget build(BuildContext context) {
    String taskStart = "4 PM";
    String taskEnd = "8 PM";
    double progress = _calculateProgress(taskStart, taskEnd);

    return Scaffold(
      backgroundColor: Color(0xFF20140E), // Dark Brown Background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Current Day and Date
            Text(
              DateFormat('EEE').format(DateTime.now()), // e.g., Mon
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            Text(
              DateFormat('d').format(DateTime.now()), // e.g., 6
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Timeline + Task Event
            Row(
              children: [
                // Vertical Dashed Line + Current Time
                Column(
                  children: [
                    Container(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.white54,
                        thickness: 2,
                        width: 20,
                        indent: 0,
                        endIndent: 10,
                      ),
                    ),
                    // Sphere (Current Time Indicator)
                    Row(
                      children: [
                        Text(
                          currentTime, // Real-time updating clock
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: VerticalDivider(
                        color: Colors.white54,
                        thickness: 2,
                        width: 20,
                        indent: 10,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),

                // Event Card Widget
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF8DA769), // Greenish event card color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Title",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Task Description",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 5),

                        // Task Schedule Time
                        Text(
                          "$taskStart > $taskEnd",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),

                        SizedBox(height: 8),

                        // Progress Bar + Dropdown Button
                        Row(
                          children: [
                            // Progress Indicator
                            Expanded(
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.white30,
                                color: Colors.white,
                                minHeight: 4,
                              ),
                            ),
                            SizedBox(width: 10),

                            // Dropdown Button for Task Status
                            PopupMenuButton<String>(
                              icon: Icon(Icons.more_vert, color: Colors.white),
                              onSelected: (String value) {
                                setState(() {
                                  taskStatus = value;
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                    value: "Completed",
                                    child: Text("Completed")),
                                PopupMenuItem<String>(
                                    value: "Backlog", child: Text("Backlog")),
                                PopupMenuItem<String>(
                                    value: "In Progress",
                                    child: Text("In Progress")),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
