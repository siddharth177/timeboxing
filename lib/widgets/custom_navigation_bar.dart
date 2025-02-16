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
      : selectedIndex = -1,
        onItemPressed = _dummyOnItemPressed,
        onFabPressed = _dummyOnFabPressed;

  static void _dummyOnItemPressed(int index) {}
  static void _dummyOnFabPressed() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> finalTabs = formNavBarTabs();
    return BottomAppBar(
      color: Colors.deepPurpleAccent,
      shape: const CircularNotchedRectangle(), // Creates a notch for the FAB

      notchMargin: 6.0, // The gap between the FAB and the bottom bar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: finalTabs,
      ),
    );
  }

  List<Widget> formNavBarTabs() {
    List<Widget> leftIcons = [
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
    ];
    List<Widget> rightIcons = [
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
    ];
    var finalTabs = <Widget>[...leftIcons];
    if (selectedIndex != -1) {
      // space needed for floating action button
      finalTabs.add(const SizedBox(width: 48.0));
    }
    finalTabs.addAll(rightIcons);
    return finalTabs;
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: () => onFabPressed(),
      backgroundColor: Colors.pink,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButtonLocation get fabLocation =>
      FloatingActionButtonLocation.miniCenterDocked;
}
