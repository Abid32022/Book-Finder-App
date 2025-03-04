import 'dart:ui';
import 'package:flutter/cupertino.dart';

class AppColors{
  static const Color primaryColor = Color(0xffFFFFFF);
  static const Color secondayColor = Color(0xffFFFFFF);

  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);


  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6200EA),
      Color(0xFF03DAC6),
    ],
  );

}