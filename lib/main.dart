// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/constants/constants.dart';
import 'package:carbon_counter/screens/base_screen.dart';
import 'package:carbon_counter/screens/demo_screen.dart';
import 'package:flutter/material.dart';

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
      initialRoute: BaseScreen.id,
      routes: {
        BaseScreen.id : (context) => BaseScreen(duration: 3,nextPage: DemoScreen(),),
        DemoScreen.id : (context) => DemoScreen(),
      },
    );
  }
}
