import 'package:flutter/material.dart';

class ErrorDialog {
  Future<void> showDialog1(BuildContext context, error) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Could not process request.'),
          content: Text(error),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
