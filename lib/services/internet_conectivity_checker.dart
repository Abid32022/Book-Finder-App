import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService {
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  late InternetConnectionChecker _internetConnectionChecker;

  ConnectivityService() {
    _initialize();
  }

  Future<void> _initialize() async {
    _internetConnectionChecker = await InternetConnectionChecker.createInstance();
    _internetConnectionChecker.onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      _controller.add(hasInternet);
    });
  }

  Stream<bool> get connectivityStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}