import 'package:flutter/material.dart';

class CurvedNavigationBar extends StatelessWidget {
  final List<Widget> items;
  final int currentIndex;
  final Function(int) onTap;

  CurvedNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              int idx = entry.key;
              Widget icon = entry.value;
              return GestureDetector(
                onTap: () => onTap(idx),
                child: Container(
                  width: 60,
                  height: 60,
                  child: icon,
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 30,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Content Here')),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(Icons.home, color: Colors.black),
            Icon(Icons.chat_bubble_outline, color: Colors.grey),
            Icon(Icons.bar_chart, color: Colors.grey),
            Icon(Icons.person_outline, color: Colors.grey),
          ],
          currentIndex: 0,
          onTap: (index) {
            // Handle navigation tap
          },
        ),
      ),
    );
  }
}
