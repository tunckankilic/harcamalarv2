// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harcamalarv2/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.red,
          fontFamily: 'QuickSand'),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
