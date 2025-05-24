import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PositionedLoadingWidget extends StatefulWidget {
  const PositionedLoadingWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PositionedLoadingWidget();
  }
}

class _PositionedLoadingWidget extends State<PositionedLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      left: 0,
      child: RiveAnimation.asset(
          speedMultiplier: 3, 'assets/animations/rive/dot_loading.riv'),
    );
  }
}
