import 'package:flutter/foundation.dart';

mixin LoadingMixin on ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading({required bool loading}) {
    _loading = loading;
    notifyListeners();
  }
}
