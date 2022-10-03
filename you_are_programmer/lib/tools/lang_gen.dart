// generate different language type word

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String genLang({String text = '说些什么呢...', String lang = 'C'}) {
  // Change /n to //n
  text = text.replaceAll('\n', r'\n');

  if (lang == 'C') {
    return '''printf("$text\\n");''';
  }

  if (lang == 'C++') {
    return '''cout << "$text" << endl;''';
  }

  if (lang == 'Dart (Wedget)') {
    return '''const MaterialApp(home: Center(child: Text('$text')));''';
  }

  return '啊呀啊呀，程序出错啦...';
}
