

// Create a service locator
import 'package:get_it/get_it.dart';
import 'package:my_qurbani/utils/local_provider.dart';

import '../../config/app_validators.dart';
import '../../services/secure_storage_services.dart';
import '../../services/shared_preference_service.dart';
import '../../config/get_it.dart';
import 'multiple_image_picker.dart';

final locator = GetIt.instance;
// Setup service locator
void setupLocator() {

  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<AppLocalStorageServices>(() => AppLocalStorageServices());
  getIt.registerLazySingleton<AppSecureStorageServices>(() => AppSecureStorageServices());
  getIt.registerLazySingleton<AppValidator>(() => AppValidator());
  getIt.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
  getIt.registerLazySingleton<LocalProvider>(() => LocalProvider());

}
