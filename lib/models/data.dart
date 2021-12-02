// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';

class Data extends ChangeNotifier {
  String fuelData = "";
  double mileage = 0;
  double distance = 0;

  getFuel(String fuel) {
    fuelData = fuel;
    notifyListeners();
  }

  show() {
    print(fuelData);
    print(mileage);
    print(distance);
  }

  getMileage(double mile) {
    mileage = mile;
    notifyListeners();
  }

  getDistance(double d) {
    distance = d;
    notifyListeners();
  }
}
