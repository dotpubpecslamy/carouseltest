import 'package:flutter/material.dart';

class DialogService {
  static Future<void> showErrorDialog(BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context), 
            ),
          ],
        );
      },
    );
  }

  
}