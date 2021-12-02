// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  int duration;
  Widget nextPage;
  static String id = "BaseScreen";
  BaseScreen({Key? key, this.duration = 0, required this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => nextPage));
    });

    return Scaffold(
        body: Center(
      child: Text(
        "Carbon Counter",
        style: Theme.of(context).textTheme.headline1,
      ),
    ));
  }
}
