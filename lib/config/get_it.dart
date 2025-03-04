import 'package:get_it/get_it.dart';

// Create a service locator
final getIt = GetIt.instance;
// Setup service locator
void setupLocator() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
}

// void main() {
//   setupLocator();
//
//   // Access the service
//   final authService = getIt<AuthService>();
//   final authService2 = AuthService();
//
//   authService2.isLoggedIn;
//
//   print(authService.isLoggedIn); // Output: false
//
//   authService.login();
//   print(authService.isLoggedIn); // Output: true
// }

// Example service
class AuthService {
  bool isLoggedIn = false;

  void login() => isLoggedIn = true;
  void logout() => isLoggedIn = false;
}
