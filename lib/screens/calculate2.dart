// ignore_for_file: avoid_print, unused_local_variable
import 'package:carbon_counter/models/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isLoading = true; //create a variable to define wheather loading or not

double ghg2 = 0;

class Calculate2 extends StatefulWidget {
  const Calculate2({
    Key? key,
  }) : super(key: key);

  @override
  _Calculate2State createState() => _Calculate2State();
}

class _Calculate2State extends State<Calculate2> {
  List fuelTypes = [];
  final CollectionReference fuelsList =
      FirebaseFirestore.instance.collection("Fuels");
  @override
  Widget build(BuildContext context) {
    double distance = Provider.of<Data>(context).distance;
    final double milage = Provider.of<Data>(context).mileage;
    final String fuel = Provider.of<Data>(context).fuelData;

    double getGHG() {
      FirebaseFirestore.instance
          .collection("Fuels")
          .doc(fuel)
          .get()
          .then((value) {
        // print(value.data());
        ghg2 = value.data()!['GHG'];
        setState(() {});
      });
      return ghg2;
    }

    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Carbon Emmision: "),
              Center(
                  child: Text(calculate(distance, milage, getGHG()).toString()))
            ],
          ),
        ),
      ),
    );
  }

  double calculate(double distance, double mileage, double g) {
    double ghg = (distance / mileage) * g;
    return ghg;
  }
}
