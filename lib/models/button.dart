// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable

import 'package:carbon_counter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  CustomButton({Key? key, required this.onSubmit}) : super(key: key);
  Function onSubmit;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color newColor = secondaryShrinePink;
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSubmit();
        //TODO: Firestore....
      },
      onTapDown: (TapDownDetails) {
        onPressed = !onPressed;
        setState(() {});
      },
      onTapUp: (TapUpDetails) {
        onPressed = false;
        setState(() {});
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: onPressed ? newColor : Colors.white,
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
            ]),
        child: Center(
            child: Text(
          "Calculate",
          style: GoogleFonts.lato(color: darkShrinePink, fontSize: 20),
        )),
      ),
    );
  }
}
