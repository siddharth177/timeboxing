import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NoDisturbLandingScreen extends StatefulWidget {
  const NoDisturbLandingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoDisturbLandingScreen();
  }
}

class _NoDisturbLandingScreen extends State<NoDisturbLandingScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48
            ),
          )
        ],
      ),),
    );
  }
}