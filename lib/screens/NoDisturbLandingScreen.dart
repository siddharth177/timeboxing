import 'package:flutter/material.dart';
import 'package:timeboxing/Utilities/date_time.dart';

class NoDisturbLandingScreen extends StatefulWidget {
  const NoDisturbLandingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoDisturbLandingScreen();
  }
}

class _NoDisturbLandingScreen extends State<NoDisturbLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              weekDayShortNow(),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dayNow(),
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Column(
                        children: List.generate(
                            (constraints.maxHeight / 20).floor(),
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 10,
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                )),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
