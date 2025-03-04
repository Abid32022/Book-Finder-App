import 'dart:io'; // For Platform check
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showPlatformSnackbar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 2),
}) {
  if (Platform.isAndroid) {
    // Show Material Snackbar for Android
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
      ),
    );
  } else if (Platform.isIOS) {
    // Show Cupertino Snackbar for iOS
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: 50.0,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: CupertinoPopupSurface(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey5.withOpacity(0.95),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.info,
                    color: CupertinoColors.activeBlue,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove the snackbar after the duration
    Future.delayed(duration, () {
      overlayEntry?.remove();
    });
  }
}
