import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_time_range_picker/flutter_time_range_picker.dart';

class SleepTrackingWidget extends StatefulWidget {
  @override
  _SleepTrackingWidgetState createState() => _SleepTrackingWidgetState();
}

class _SleepTrackingWidgetState extends State<SleepTrackingWidget> {
  DateTime selectedDate = DateTime.now();
  Map<String, String> sleepStatus = {};
  String sleepTimeRange = "Not Set";

  @override
  void initState() {
    super.initState();
    _loadDummyData();
  }

  void _loadDummyData() {
    DateTime startOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday % 7));
    for (int i = 0; i < 7; i++) {
      sleepStatus[
          DateFormat('EEE').format(startOfWeek.add(Duration(days: i)))] = '?';
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _loadDummyData();
      });
    }
  }

  void _selectSleepSchedule() async {
    final result = await showTimeRangePicker(
      context: context,
      start: TimeOfDay(hour: 22, minute: 0),
      end: TimeOfDay(hour: 6, minute: 0),
    );
    if (result != null) {
      setState(() {
        sleepTimeRange =
            "${result.startTime.format(context)} - ${result.endTime.format(context)}";
      });
    }
  }

  void _updateSleepStatus(String day) {
    setState(() {
      if (sleepStatus[day] == '?') {
        sleepStatus[day] = '✓';
      } else if (sleepStatus[day] == '✓') {
        sleepStatus[day] = '✗';
      } else {
        sleepStatus[day] = '?';
      }
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case '✓':
        return Colors.green;
      case '✗':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sleep',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                IconButton(
                  icon: Icon(Icons.schedule),
                  onPressed: _selectSleepSchedule,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("Sleep Time Range: $sleepTimeRange",
            style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: sleepStatus.entries.map((entry) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => _updateSleepStatus(entry.key),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: _getStatusColor(entry.value),
                    child: Text(entry.value,
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 5),
                Text(entry.key),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
