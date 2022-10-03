// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

var pri_color = Colors.cyan.shade700;
var second_color = Colors.cyan.shade300;

ThemeData ThemeCyan = ThemeData(
    // primarySwatch: Colors.red,

    // the main color
    primaryColor: pri_color,

    // sometimes you need to specify a secondartHeaderColor
    secondaryHeaderColor: second_color,

    // hoverColor: Colors.red.shade800,
    // focusColor: Colors.red.shade300,
    colorScheme: ColorScheme.fromSeed(seedColor: pri_color, primary: pri_color),
    // colorSchemeSeed: Colors.red.shade300,
    // textTheme: TextTheme(subtitle1: TextStyle(fontSize: 17)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50))));
