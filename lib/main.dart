// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/constants/constants.dart';
import 'package:carbon_counter/models/data.dart';
import 'package:carbon_counter/screens/base_screen.dart';
import 'package:carbon_counter/screens/calculate2.dart';
import 'package:carbon_counter/screens/demo_screen.dart';
import 'package:carbon_counter/screens/drop.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        // initialRoute: BaseScreen.id,
        initialRoute: BaseScreen.id,
        routes: {
          BaseScreen.id: (context) => BaseScreen(
                duration: 5,
                nextPage: DropDownWithPanDownAndDrawer(),
              ),
          DemoScreen.id: (context) => DemoScreen(),
          DropDownWithPanDownAndDrawer.id: (context) =>
              DropDownWithPanDownAndDrawer(),
        },
      ),
    );
  }
}
