// generate different language type word

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String genLang({String text = '说些什么呢...', String lang = 'C'}) {
  // Change /n to //n
  text = text.replaceAll('\n', r'\n');

  if (lang == 'C') {
    return '''printf("$text");''';
  }

  if (lang == 'C (2)') {
    return '''#include <stdio.h>
int main()
{
    printf("$text");
    getchar();
    return 0;
}''';
  }

  if (lang == 'C++') {
    return '''cout << "$text";''';
  }

  if (lang == 'C++ (2)') {
    return '''include <iostream>

int main()
{
    std::cout << "$text";
    getchar();
    return 0;
}''';
  }

  if (lang == 'C++ (3)') {
    return '''include <iostream>
using namespace std;

int main()
{
    cout << "$text";
    getchar();
    return 0;
}''';
  }

  if (lang == 'Dart') {
    return '''print('$text');''';
  }

  if (lang == 'Dart (Wedget)') {
    return '''const MaterialApp(home: Center(child: Text('$text')));''';
  }

  if (lang == 'Python') {
    return '''print('$text')''';
  }

  if (lang == 'Java') {
    return '''System.out.println("$text")''';
  }

  if (lang == 'Kotlin') {
    return '''println("$text")''';
  }
  return '啊呀啊呀，程序出错啦...';
}
