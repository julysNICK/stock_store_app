import 'package:flutter/material.dart';

class Popup_Error extends StatelessWidget {
  final String errorMessage;
  const Popup_Error({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: const Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            Text(
              "Error",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        content: Text(errorMessage ?? "Error"),
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
