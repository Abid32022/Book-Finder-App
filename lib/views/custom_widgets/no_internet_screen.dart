import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('No Internet Connection'),

          ],
        ),
      ),
    );
  }
}
