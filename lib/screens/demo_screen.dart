// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/models/customdropdown.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  static String id = "DemoScreen";
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomDropDown(),
    ));
  }
}
