import 'package:flutter/material.dart';


class MoodHistoryWidget extends StatefulWidget {
  @override
  _MoodHistoryWidgetState createState() => _MoodHistoryWidgetState();
}

class _MoodHistoryWidgetState extends State<MoodHistoryWidget> {
  List<Map<String, dynamic>> moods = [
    {"day": "Mon", "emoji": "😊", "color": Colors.green},
    {"day": "Tue", "emoji": "😃", "color": Colors.lightGreen},
    {"day": "Wed", "emoji": "😵", "color": Colors.blue},
    {"day": "Thu", "emoji": "🙂", "color": Colors.yellow},
    {"day": "Fri", "emoji": "😡", "color": Colors.red},
    {"day": "Sat", "emoji": "😐", "color": Colors.brown},
    {"day": "Sun", "emoji": "😊", "color": Colors.yellow},
  ];

  final List<Map<String, dynamic>> moodOptions = [
    {"emoji": "😊", "color": Colors.green, "label": "Happy"},
    {"emoji": "😃", "color": Colors.lightGreen, "label": "Excited"},
    {"emoji": "😵", "color": Colors.blue, "label": "Exhausted"},
    {"emoji": "🙂", "color": Colors.yellow, "label": "Neutral"},
    {"emoji": "😡", "color": Colors.red, "label": "Angry"},
    {"emoji": "😐", "color": Colors.brown, "label": "Meh"},
  ];

  void _changeMood(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: moodOptions.map((mood) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: mood["color"],
                  child: Text(mood["emoji"], style: TextStyle(fontSize: 22)),
                ),
                title: Text(mood["label"]),
                onTap: () {
                  setState(() {
                    moods[index]["emoji"] = mood["emoji"];
                    moods[index]["color"] = mood["color"];
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mood History",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: moods.asMap().entries.map((entry) {
              int index = entry.key;
              var mood = entry.value;
              return GestureDetector(
                onTap: () => _changeMood(index),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: mood["color"],
                      radius: 22,
                      child: Text(
                        mood["emoji"],
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      mood["day"],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}