

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../config/app_constant.dart';
import '../services/secure_storage_services.dart';
import '../services/shared_preference_service.dart';

class LocalProvider with ChangeNotifier {
   Future<void> setData({required String language, required String email, required String userName}) async {
    AppLocalStorageServices storage = await AppLocalStorageServices.getInstance();
    await storage.setUserLanguage(language);
    await storage.setUserEmail(email);
    await storage.setUserName(userName);
    await storage.setFontSize(0);
  }

   Future<void> loadStoredData() async {
    AppLocalStorageServices storage = await AppLocalStorageServices.getInstance();
    // AppConstants.getLanguage = storage.getUserLanguage() ?? 'no language';
    // AppConstants.getName = storage.getUserName() ?? 'no name';
    // AppConstants.getEmail = storage.getUserEmail() ?? 'no email';
    // print("This is name ======> ${AppConstants.getName}");
    notifyListeners();
  }

   Future<void> setUserToken({required String userToken}) async {
    AppSecureStorageServices storage = await AppSecureStorageServices.getInstance();
    await storage.setUserToken(userToken);
    notifyListeners();
  }

   Future<void> getUserToken() async {
    AppSecureStorageServices storage = await AppSecureStorageServices.getInstance();
    AppConstants.getToken = (await storage.getUserToken()) ?? ''; // Await the result

    if(kDebugMode){
      print("This is token in constants =======>> ${AppConstants.getToken}");
    }
    notifyListeners();
  }
}