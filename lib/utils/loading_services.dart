import 'package:flutter/foundation.dart';

class LoadingService {
  final Map<String, ValueNotifier<bool>> _loadingStates = {};

  ValueNotifier<bool> getLoadingNotifier(String key) {
    if (!_loadingStates.containsKey(key)) {
      _loadingStates[key] = ValueNotifier<bool>(false); // Initialize with false
    }
    return _loadingStates[key]!;
  }

  bool isLoading(String key) => getLoadingNotifier(key).value;

  void setLoading(String key, bool value) {
    if (!_loadingStates.containsKey(key)) {
      _loadingStates[key] = ValueNotifier<bool>(value); // Initialize with the provided value
    } else {
      _loadingStates[key]!.value = value; // Update the value
    }
    print('Set loading for $key to $value'); // Debug print
  }
}

final loadingService = LoadingService();
