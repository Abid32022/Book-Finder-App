import 'dart:io'; // To check the platform
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showPlatformDialog(BuildContext context) {
  if (Platform.isAndroid) {
    // Show Material Dialog for Android
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Android Dialog"),
          content: const Text("This is a Material AlertDialog for Android."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform additional actions here
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  } else if (Platform.isIOS) {
    // Show Cupertino Dialog for iOS
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("iOS Dialog"),
          content: const Text("This is a CupertinoAlertDialog for iOS."),
          actions: [
            CupertinoDialogAction(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform additional actions here
              },
            ),
          ],
        );
      },
    );
  }
}
