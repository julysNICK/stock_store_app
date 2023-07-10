import 'package:flutter/material.dart';

class Popup_Success extends StatelessWidget {
  final String errorSuccess;
  const Popup_Success({
    super.key,
    required this.errorSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            Text(
              "Success",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        content: Text(errorSuccess ?? "Success"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
