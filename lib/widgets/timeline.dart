import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final double gapHeight;
  const Timeline(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.gapHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gapHeight, // keep it variable to change the gap between
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: const LineStyle(color: Colors.red),
          indicatorStyle: IndicatorStyle(
            width: 40,
            color: Colors.blueAccent,
            iconStyle: IconStyle(
              iconData: Icons.timelapse,
              color: Colors.white,
            ),
          )),
    );
  }
}
