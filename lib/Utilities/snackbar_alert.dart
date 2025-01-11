import 'package:flutter/material.dart';

import '../models/alert_type.dart';

void clearAndDisplaySnackbar(BuildContext context, String message, {int duration = 4, AlertType alertType = AlertType.info}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      backgroundColor: Colors.blue,
    ),
  );
}