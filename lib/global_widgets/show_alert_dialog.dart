import 'package:flutter/material.dart';

void showAlertDialog(context, String title, String content) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black.withOpacity(0.5),
            content: Text(content, style: const TextStyle(color: Colors.white)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(_);
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ));
}
