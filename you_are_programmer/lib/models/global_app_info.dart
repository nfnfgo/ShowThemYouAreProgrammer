// Global App Info
// For Provider

// Tools
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalAppInfo with ChangeNotifier {
  String _lang = 'C';

  /// Change The Language Setting
  ///
  /// return: `true` if succesfully changed.
  /// If the newLang is same to the previous
  /// one return `false`
  bool changeLang(String newLang) {
    if (_lang == newLang) {
      return false;
    } else {
      _lang = newLang;
      // Implement UI change
      notifyListeners();
      return true;
    }
  }
}
