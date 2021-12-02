import 'package:carbon_counter/models/customdropdown.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  static String id = "DemoScreen";
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  List<String> items = [
    'Biodiesel',
    'CNG',
    'Diesel',
    'Electricity',
    'LPG',
    'Petrol'
  ];
  String dropDownValue = 'Petrol';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomDropDown(),
      ),
    );
  }
}
