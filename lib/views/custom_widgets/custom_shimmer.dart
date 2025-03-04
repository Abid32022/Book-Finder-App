import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerPlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;

  const ShimmerPlaceholder({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class CircleAvat extends StatelessWidget {
  // final double height;
  // final double width;
  final double Radius;
  final BorderRadius borderRadius;

  const CircleAvat({
    Key? key,
    // required this.height,
    this.Radius = 20,
    // required this.width,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: Radius,
      ),
      // Container(
      //   height: height,
      //   width: width,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: borderRadius,
      //   ),
      // ),
    );
  }
}

class TextLongShimmer extends StatelessWidget {
  // final double height;
  // final double width;
  final BorderRadius borderRadius;

  TextLongShimmer({
    // Key? key,
    // required this.height,
    // required this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        height: 30,
        color: Colors.white,
        width: double.infinity,
        // backgroundColor: Colors.white,
      ),
      // Container(
      //   height: height,
      //   width: width,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: borderRadius,
      //   ),
      // ),
    );
  }
}

class TextShortShimmer extends StatelessWidget {
  // final double height;
  // final double width;
  final BorderRadius borderRadius;

  TextShortShimmer({
    // Key? key,
    // required this.height,
    // required this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 30,
            color: Colors.white,
            width: 200,
            // backgroundColor: Colors.white,
          ),
        ],
      ),
      // Container(
      //   height: height,
      //   width: width,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: borderRadius,
      //   ),
      // ),
    );
  }
}
