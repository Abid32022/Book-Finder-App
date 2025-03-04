import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorageServices {
  static AppSecureStorageServices? _instance;
  static FlutterSecureStorage? _secureStorage;

  static Future<AppSecureStorageServices> getInstance() async {
    _instance ??= AppSecureStorageServices();
    _secureStorage ??= const FlutterSecureStorage();
    return _instance!;
  }

  Future<void> _saveData(String key, dynamic value) async {
    if (value is String) {
      await _secureStorage!.write(key: key, value: value);
    } else if (value is bool) {
      await _secureStorage!.write(key: key, value: value.toString());
    } else if (value is int) {
      await _secureStorage!.write(key: key, value: value.toString());
    } else if (value is double) {
      await _secureStorage!.write(key: key, value: value.toString());
    } else if (value is List<String>) {
      await _secureStorage!.write(key: key, value: value.join(','));
    } else {
      throw Exception('Unsupported value type');
    }
  }

  Future<dynamic> _getData(String key) async {
    String? value = await _secureStorage!.read(key: key);
    return value;
  }

  Future<void> removeData(String key) async {
    await _secureStorage!.delete(key: key);
  }

  // User language methods
  Future<void> setUserLanguage(String languageCode) async {
    await _saveData('language', languageCode);
  }

  Future<String?> getUserLanguage() async {
    return await _getData('language');
  }

  // User name methods
  Future<void> setUserName(String userName) async {
    await _saveData('userName', userName);
  }

  Future<String?> getUserName() async {
    return await _getData('userName');
  }

  // User email methods
  Future<void> setUserEmail(String email) async {
    await _saveData('userEmail', email);
  }

  Future<String?> getUserEmail() async {
    return await _getData('userEmail');
  }

  // User token methods
  Future<void> setUserToken(String token) async {
    await _saveData('userToken', token);
  }

  Future<String?> getUserToken() async {
    return await _getData('userToken') as String;
  }


// //otp token
  Future<void> setOtpToken(String token) async {
    await _saveData('otpToken', token);
  }

  Future<String?> getOtpToken() async {
    return await _getData('otpToken');
  }


  // Clear all data
  Future<void> clearAllData() async {
    await _secureStorage!.deleteAll();
    print("Flutter Secure Storage cleared =============================>>>");
  }

}
