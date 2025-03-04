import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePickerService _instance = ImagePickerService._internal();
  factory ImagePickerService() => _instance;
  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();

  Future<List<File>> pickMultipleImages() async {
    try {
      final List<XFile>? pickedImages = await _picker.pickMultiImage();
      if (pickedImages != null && pickedImages.isNotEmpty) {
        return pickedImages.map((image) => File(image.path)).toList();
      }
    } catch (e) {
      print("Error picking images: $e");
    }
    return [];
  }
}
