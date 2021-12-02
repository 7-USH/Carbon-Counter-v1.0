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
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList()),
      ),
    );
  }
}
