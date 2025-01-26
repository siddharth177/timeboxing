import 'package:flutter/material.dart';

import '../models/alert_type.dart';


class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    required AlertType alertType,
    Function? onUndo,
    Function? onDelete,
  }) {
    final Map<AlertType, Map<String, dynamic>> alertStyles = {
      AlertType.success: {
        "color": Colors.green,
        "icon": Icons.check_circle,
        "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      },
      AlertType.error: {
        "color": Colors.red,
        "icon": Icons.error,
        "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      },
      AlertType.warn: {
        "color": Colors.orange,
        "icon": Icons.warning,
        "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      },
      AlertType.info: {
        "color": Colors.blue,
        "icon": Icons.info,
        "textStyle": TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      },
    };

    final style = alertStyles[alertType]!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(style["icon"], color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: style["textStyle"],
              ),
            ),
          ],
        ),
        backgroundColor: style["color"],
        // action: SnackBarAction(
        //   label: 'UNDO',
        //   textColor: Colors.white,
        //   onPressed: () {
        //     if (onUndo != null) onUndo();
        //   },
        // ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
  }
}