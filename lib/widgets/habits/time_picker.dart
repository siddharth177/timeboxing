import 'package:flutter/material.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepTimePicker extends StatefulWidget {
  @override
  _SleepTimePickerState createState() => _SleepTimePickerState();
}

class _SleepTimePickerState extends State<SleepTimePicker> {
  PickedTime _sleepStart = PickedTime(h: 22, m: 0); // 10:00 PM
  PickedTime _sleepEnd = PickedTime(h: 6, m: 0); // 6:00 AM

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Select Sleep Schedule")),
      body: Center(
        child: TimePicker(
          initTime: _sleepStart,
          endTime: _sleepEnd,
          onSelectionChange: (start, end) {
            setState(() {
              _sleepStart = start;
              _sleepEnd = end;
            });
          },
          onSelectionEnd: (start, end) {
            print("Sleep Start: ${start.h}:${start.m}");
            print("Sleep End: ${end.h}:${end.m}");
          },
          primarySectors: 24,
          secondarySectors: 0,
          decoration: TimePickerDecoration(
            baseColor: Colors.blueGrey[900]!,
            sweepDecoration: TimePickerSweepDecoration(
              color: Colors.blueAccent.withOpacity(0.6),
              showConnector: true,
              pickerStrokeWidth: 1,
            ),
            baseLineColor: Colors.blueGrey[700]!,
            pointerColor: Colors.blueAccent,
            clockNumberDecoration: TimePickerClockNumberDecoration(
              defaultTextColor: Colors.white,
              highlightedTextColor: Colors.blueAccent,
            ),
            initHandlerDecoration: null,
          ),
        ),
      ),
    );
  }
}
