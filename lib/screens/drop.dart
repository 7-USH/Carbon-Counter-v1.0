// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, prefer_const_constructors, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable

import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:carbon_counter/constants/constants.dart';
import 'package:carbon_counter/models/button.dart';
import 'package:carbon_counter/models/data.dart';
import 'package:carbon_counter/screens/transport_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

double milage = 0;
double distance = 0;
String fuelType = "";

class DropDownWithPanDownAndDrawer extends StatefulWidget {
  TextEditingController milage = TextEditingController();
  static String id = "Drop";
  @override
  _DropDownWithPanDownAndDrawerState createState() =>
      _DropDownWithPanDownAndDrawerState();
}

class _DropDownWithPanDownAndDrawerState
    extends State<DropDownWithPanDownAndDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  late List<String> _list;
  String _selectedItem = '';

  @override
  void initState() {
    _list = ['Petrol', "Diesel", "CNG", "LPG", "Biodiesel"];
    _selectedItem = 'Select Fuel Type';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// we need to wrap our Scaffold in GestureDetector in order to get required functionalities
    ///  i.e. close the dropdown on drawer click and touch on outside
    return GestureDetector(
      onTap: _removeFocus,
      onPanDown: (focus) {
        _isPanDown = true;
        _removeFocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 15, left: 16, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransportOptions(),
                  AwesomeDropDown(
                    numOfListItemToShow: 6,
                    dropDownBGColor: Colors.white,
                    isPanDown: _isPanDown,
                    dropDownList: _list,
                    isBackPressedOrTouchedOutSide:
                        _isBackPressedOrTouchedOutSide,
                    selectedItem: _selectedItem,
                    selectedItemTextStyle:
                        GoogleFonts.lato(color: darkShrinePink, fontSize: 20),
                    dropDownListTextStyle:
                        GoogleFonts.lato(color: darkShrinePink, fontSize: 20),
                    onDropDownItemClick: (selectedItem) {
                      _selectedItem = selectedItem;
                      fuelType = _selectedItem;
                      Provider.of<Data>(context,listen: false).getFuel(fuelType);
                      //  read selected Item
                    },
                    dropStateChanged: (isOpened) {
                      _isDropDownOpened = isOpened;
                      if (!isOpened) {
                        _isBackPressedOrTouchedOutSide = false;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hint: "Enter Mileage",
                    suffix: "Km/L",
                    index: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hint: "Enter Distance",
                    suffix: "Km",
                    index: 1,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    fuelType: fuelType,
                    milage: milage,
                    distance: distance,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// this func is used to close dropDown (if open) when you tap or pandown anywhere in the screen
  void _removeFocus() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
    }
  }

  /// this func will call on DrawerIconPressed, it closes the dropDown if open and then open the drawer
  void _onDrawerBtnPressed() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}

class CustomTextField extends StatelessWidget {
  String hint;
  String suffix;
  int index;
  CustomTextField(
      {Key? key, this.suffix = "", required this.hint, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23),
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
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: TextField(
          keyboardType: TextInputType.number,
          cursorColor: darkShrinePink,
          decoration: InputDecoration(
            suffixText: suffix,
            suffixStyle: GoogleFonts.lato(color: darkShrinePink, fontSize: 17),
            hintStyle: GoogleFonts.lato(color: darkShrinePink, fontSize: 20),
            hintText: hint,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onChanged: (value) {
            print(value);
            index == 0
                ? milage = double.parse(value)
                : distance = double.parse(value);

            Provider.of<Data>(context, listen: false).getDistance(distance);
            Provider.of<Data>(context, listen: false).getMileage(milage);
            // take
          },
        ),
      ),
    );
  }
}
