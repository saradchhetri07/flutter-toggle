import 'package:flutter/cupertino.dart';

class DarkModeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  get darkMode => _isDarkMode;
  toggle() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
