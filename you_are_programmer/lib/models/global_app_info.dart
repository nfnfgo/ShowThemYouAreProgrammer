// Global App Info
// For Provider

// Tools
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_are_programmer/tools/lang_gen.dart';

class GlobalAppInfo with ChangeNotifier {
  String _lang = 'C';
  String _text = '';

  List<String> _langList = [
    'C',
    'C (2)',
    'C++',
    'C++ (2)',
    'C++ (3)',
    'Dart',
    'Dart (Wedget)',
    'Python',
    'Java',
    'Kotlin',
  ];

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

  String getGenText() {
    return genLang(text: _text, lang: _lang);
  }

  void setText(String text) {
    _text = text;
    notifyListeners();
  }

  String getLang() {
    return _lang;
  }

  List<String> getLangList() {
    return _langList;
  }
}
