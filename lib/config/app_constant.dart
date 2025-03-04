import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../services/shared_preference_service.dart';

class AppConstants {

  static Future<void> getImage(Function(String?) updateImagePath) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      updateImagePath(pickedImage.path);
    }
  }

  // static Future<void> getExcelFile(Function(String?) updateFilePath) async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['xls', 'xlsx'],
  //     );
  //
  //     if (result != null && result.files.isNotEmpty) {
  //       String? filePath = result.files.single.path;
  //       updateFilePath(filePath);
  //     } else {
  //       updateFilePath(null);
  //     }
  //   } catch (e) {
  //     print("Error picking file: $e");
  //     updateFilePath(null);
  //   }
  // }

  static bool themValue = false;
  static String getLanguage = "";
  static String getName = "";
  static String getEmail = "";
  static String getToken = "";
  static String getotpToken = "";

  static bool enableDisable2FA = false;
  static bool enableDisableBioAuth = false;
  static bool enableDisableDataBackup = false;
  static bool securityAlerts = false;
  static bool regularUpdates = false;
  static bool promotionalNotifications = false;


  static Future<void> saveSelectedFontSize({required int index}) async {
    AppLocalStorageServices storage = await AppLocalStorageServices.getInstance();
    storage.setFontSize(index);
  }

  static flutterToast({required String message}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);

  static String formatDate(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }

  static void copyToClipboard({required TextEditingController controller}) {
    Clipboard.setData(ClipboardData(text: controller.text)).then((_) {
      flutterToast(message: "Copied to clipboard");
    });
  }

}

extension EmptySpace on num {
  SizedBox get ht => SizedBox(height: toDouble().h);
  SizedBox get wd => SizedBox(width: toDouble().w);
}
