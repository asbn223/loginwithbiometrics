import 'package:flutter/material.dart';

ScaffoldMessengerState showCustomSnackBar(
  BuildContext context, {
  required String message,
  Color snackBarColor = Colors.red,
  IconData icon = Icons.error,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 3),
        backgroundColor: snackBarColor,
      ),
    );
}
