import 'package:flutter/material.dart';

import '../enums/alert_type.dart';

void clearAndDisplaySnackbar(BuildContext context, String message,
    {int duration = 4, AlertType alertType = AlertType.info}) {
  clearSnackbar(context);
  displaySnackBar(context, message,
      duration: duration, alertType: AlertType.info);
}

void displaySnackBar(BuildContext context, String message,
    {int duration = 4, AlertType alertType = AlertType.info}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          label: 'Dismiss', // TODO: customize
          disabledTextColor: Colors.white, //TODO: design
          onPressed: () {
            clearSnackbar(context);
          }),
      backgroundColor: Colors.blue, //TODO: change with alertType
    ),
  );
}

void clearSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
}
