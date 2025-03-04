import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final bool loading; // Whether the button should show a loading spinner
  final VoidCallback onPressed; // Function to be called when the button is pressed
  final Color color; // Button color
  final double width; // Button width
  final double height; // Button height

  const CustomButton({
    Key? key,
    required this.text,
    required this.loading,
    required this.onPressed,
    this.color = Colors.blue,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onPressed, // Disable tap when loading
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: loading ? color.withOpacity(0.7) : color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: loading
            ?
        Platform.isIOS?
        CupertinoActivityIndicator(
          radius: 15.0, // Adjust the size of the spinner
        ):

        SpinKitWave(
          color: Colors.white,
          size: 20.0,
        )

            : Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



// SizedBox(
//   width: 200,
//   child: SpinKitWave(
//     color: Colors.pink,
//     size: 20.0,
//   ),
// )
// SpinKitCircle(
// color: Colors.white, // Spinner color
// size: 30.0, // Spinner size
// )