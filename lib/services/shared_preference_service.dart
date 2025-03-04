import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageServices {
  static AppLocalStorageServices? _instance;
  static SharedPreferences? _preferences;

  static Future<AppLocalStorageServices> getInstance() async {
    _instance ??= AppLocalStorageServices();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> _saveData(String key, dynamic value) {
    if (value is String) {
      return _preferences!.setString(key, value);
    }
    if (value is bool) {
      return _preferences!.setBool(key, value);
    }
    if (value is int) {
      return _preferences!.setInt(key, value);
    }
    if (value is double) {
      return _preferences!.setDouble(key, value);
    }
    if (value is List<String>) {
      return _preferences!.setStringList(key, value);
    }
    throw Exception('Unsupported value type');
  }

  dynamic _getData(String key) {
    if (_preferences!.containsKey(key)) {
      return _preferences!.get(key);
    } else {
      return null;
    }
  }

  // dynamic _getData(String key) {
  //   return _preferences!.get(key);
  // }

  Future<bool> removeData(String key) {
    return _preferences!.remove(key);
  }

  // User language methods
  Future<bool> setUserLanguage(String languageCode) {
    return _saveData('language', languageCode);
  }

  String? getUserLanguage() {
    return _getData('language') as String?;
  }

  // User name methods
  Future<bool> setUserName(String userName) {
    return _saveData('userName', userName);
  }

  String? getUserName() {
    return _getData('userName') as String?;
  }

  // User email methods
  Future<bool> setUserEmail(String email) {
    return _saveData('userEmail', email);
  }

  String? getUserEmail() {
    return _getData('userEmail') as String?;
  }

  // User token methods
  Future<bool> setUserToken(String token) {
    return _saveData('userToken', token);
  }

  String? getUserToken() {
    return _getData('userToken') as String?;
  }

  // Font size
  Future<bool> setFontSize(int index) {
    return _saveData('fontSize', index);
  }

  int? getFontSize() {
    return _getData('fontSize') as int?;
  }

  // Enable/disable 2FA
  Future<bool> setEnableDisable2FA(bool isEnabled) {
    return _saveData('enableDisable2FA', isEnabled);
  }

  bool? getEnableDisable2FA() {
    return _getData('enableDisable2FA') as bool?;
  }

  // enabled disabled biometric authentication
  Future<bool> setEnableDisableBioAuth(bool isEnabled) {
    return _saveData('enableDisableBioAuth', isEnabled);
  }

  bool? getEnableDisableBioAuth() {
    return _getData('enableDisableBioAuth') as bool?;
  }

///
  Future<bool> setEnableDisableDataBackup(bool isEnabled) {
    return _saveData('enableDisableDataBackup', isEnabled);
  }

  bool? getEnableDisableDataBackup() {
    return _getData('enableDisableDataBackup') as bool?;
  }

  // Clear all data
  Future<bool> clearAllData() async {
    return _preferences!.clear();
  }


  ///by iqra
//security alerts
  Future<bool> setSecurityAlerts(bool isEnabled) {
    return _saveData('securityAlerts', isEnabled);
  }
  bool? getSecurityAlerts() {
    return _getData('securityAlerts') as bool?;
  }


  //regular updates
  Future<bool> setRegularUpdates(bool isEnabled) {
    return _saveData('regularUpdates', isEnabled);
  }
  bool? getRegularUpdates() {
    return _getData('regularUpdates') as bool?;
  }

  //promotional notifications
  Future<bool> setPromotionalNotifications(bool isEnabled) {
    return _saveData('promotionalNotifications', isEnabled);
  }
  bool? getPromotionalNotifications() {
    return _getData('promotionalNotifications') as bool?;
  }
}