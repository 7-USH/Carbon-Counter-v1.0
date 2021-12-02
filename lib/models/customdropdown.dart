// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element

import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:carbon_counter/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

List<String> _list = ['Petrol', "Diesel", "CNG", "LPG", "Biodiesel"];

class _CustomDropDownState extends State<CustomDropDown> {
  bool isDroppedDown = false;
  late int groupValue;
  String title = "Select Fuel";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: darkShrinePink),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // drop menu
              setState(() {
                isDroppedDown = !isDroppedDown;
              });
            },
            child: Icon(
              isDroppedDown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 35,
            ),
          ),
          AwesomeDropDown(dropDownList: _list)
        ],
      ),
    );
  }
}
