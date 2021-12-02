import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final CollectionReference fuelsList =
      FirebaseFirestore.instance.collection("Fuels");

  List fuelTypes = [];
  Future fetchFuelsList() async {
    await fuelsList.get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        fuelTypes.add(element.data());
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    fetchFuelsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(fuelTypes[0])),
    );
  }
}
