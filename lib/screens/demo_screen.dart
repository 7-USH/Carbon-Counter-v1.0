// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/screens/transport_options.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  static String id = "DemoScreen";
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            TransportOptions(),
          ],
        ),
      ),
    );
  }
}
