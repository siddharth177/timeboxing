import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int N = 10;
  int M = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date grid"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: M),
        itemCount: N * M,
        itemBuilder: (BuildContext context, int index) {
          final int i = index ~/ M; // Row index
          final int j = index % M; // Column index

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text('Cell [$i][$j]'),
            ),
          );
        },
      ),
    );
  }
}
