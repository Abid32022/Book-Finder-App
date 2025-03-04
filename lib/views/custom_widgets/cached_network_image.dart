import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageURL;
  final String? placeholderImage;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const CachedNetworkImageWidget({
    super.key,
    required this.imageURL,
    this.placeholderImage,
    this.errorWidget,
    this.height,
    this.width,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      placeholder: (context, url) => placeholderImage != null
          ? Image.asset(
        placeholderImage!,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.cover,
      )
          : const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      errorWidget ?? const Icon(Icons.error),
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
    );
  }
}
