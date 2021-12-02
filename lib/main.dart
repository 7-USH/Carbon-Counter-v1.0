// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/constants/constants.dart';
import 'package:carbon_counter/screens/base_screen.dart';
import 'package:flutter/material.dart';

import 'screens/demo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: DemoScreen.id,
      routes: {
        BaseScreen.id: (context) => BaseScreen(),
        DemoScreen.id: (context) => DemoScreen(),
      },
    );
  }
}
