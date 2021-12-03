// ignore_for_file: avoid_print, unused_local_variable
import 'package:carbon_counter/models/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

bool isLoading = true; //create a variable to define wheather loading or not
 Color color = Colors.green;
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
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 100, left: 30, right: 30),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.19),
                    offset: const Offset(0.5, 4),
                    spreadRadius: 1,
                    blurRadius: 8),
                BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: const Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  "Your Carbon Emission as of Today is",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      calculate(distance, milage, getGHG()).toStringAsFixed(
                          calculate(distance, milage, getGHG())
                                      .truncateToDouble() ==
                                  calculate(distance, milage, getGHG())
                              ? 0
                              : 2),
                      style:  GoogleFonts.ptSerif(
        color: color,
        fontSize: 40,
      ),
                    ),
                     Text(
                      "  CO₂eKg",
                      style:  GoogleFonts.ptSerif(
        color: color,
        fontSize: 30,
      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculate(double distance, double mileage, double g) {
    double ghg = (distance / mileage) * g;

    if (ghg > 0.8) {
      color = Colors.red;
    }
    setState(() {
      
    }); 
    return ghg;
  }
}
