import 'dart:async';

import 'package:carbon_counter/screens/drop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

bool isLoading = true; //create a variable to define wheather loading or not

double ghg2 = 0;

class Calculate2 extends StatefulWidget {
  final double distance;
  final double milage;
  final String fuel;

  const Calculate2(
      {Key? key,
      required this.distance,
      required this.milage,
      required this.fuel})
      : super(key: key);

  @override
  _Calculate2State createState() => _Calculate2State();
}

class _Calculate2State extends State<Calculate2> {
  List fuelTypes = [];
  final CollectionReference fuelsList =
      FirebaseFirestore.instance.collection("Fuels");

  //creating the timer that stops the loading after 15 secs
  void startTimer() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      setState(() {
        isLoading = false; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  Future fetchFuelsList() async {
    await fuelsList.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        fuelTypes.add(element.data());
      }
    });
    setState(() {});
  }

  double getGHG() {
    for (int i = 0; i < fuelTypes.length; i++) {
      if (widget.fuel == fuelTypes[i]) {
        ghg2 = fuelTypes[i]["GHG"];
      }
    }
    return ghg2;
  }

  @override
  void initState() {
    startTimer(); //start the timer on loading
    fetchFuelsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(), //show this if state is loading
                  Text("Loading...."),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Carbon Emmision: "),
                    Center(
                        child: Text(
                            calculate(distance, milage, getGHG()).toString()))
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
