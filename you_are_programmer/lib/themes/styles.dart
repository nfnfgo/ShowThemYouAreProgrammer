// Main Program File
import 'package:flutter/material.dart';

// Theme

// Docs
// Provider: https://juejin.cn/post/7067356022272163847

// Customs styles of text, bottoms and so on.

// Title TextStyle
TextStyle titleTextStyle(Color color) {
  return TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: color);
}

// Button Style (like login page)
ElevatedButton bigButton = ElevatedButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)))),
    onPressed: (() {
      ;
    }),
    child: Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold),
    ));
