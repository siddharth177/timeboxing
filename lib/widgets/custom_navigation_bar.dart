import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemPressed;
  final VoidCallback onFabPressed;
  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemPressed,
    required this.onFabPressed,
  });
  const CustomNavigationBar.emptyConstructor({super.key})
      : selectedIndex = 0,
        onItemPressed = _dummyOnItemPressed,
        onFabPressed = _dummyOnFabPressed;

  static void _dummyOnItemPressed(int index) {}
  static void _dummyOnFabPressed() {}

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepPurpleAccent,
      shape: const CircularNotchedRectangle(), // Creates a notch for the FAB

      notchMargin: 6.0, // The gap between the FAB and the bottom bar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.send_time_extension),
            onPressed: () {
              onItemPressed(0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              onItemPressed(1);
            },
          ),
          const SizedBox(width: 48.0),
          IconButton(
            icon: const Icon(Icons.workspaces),
            onPressed: () {
              onItemPressed(2);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              onItemPressed(3);
            },
          ),
        ],
      ),
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: () => onFabPressed(),
      child: const Icon(Icons.add),
      backgroundColor: Colors.pink,
      shape: const CircleBorder(),
    );
  }

  FloatingActionButtonLocation get fabLocation =>
      FloatingActionButtonLocation.miniCenterDocked;
}
