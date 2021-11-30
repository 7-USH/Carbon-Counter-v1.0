// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  static String id = "BaseScreen";
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Carbon Counter",style: Theme.of(context).textTheme.headline1,),)
    );
  }
}
