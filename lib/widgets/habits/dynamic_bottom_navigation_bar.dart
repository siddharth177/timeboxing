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
