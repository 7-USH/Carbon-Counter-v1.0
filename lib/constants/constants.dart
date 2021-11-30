import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryShrinePink = Color(0xFFFEDBD0);
const Color darkShrinePink = Color(0xFF442C2E);
const Color secondaryShrinePink = Color(0xFFFEEAE6);

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: secondaryShrinePink,
  textTheme: TextTheme(
  headline1:GoogleFonts.lobsterTwo(
    color:darkShrinePink,
    fontSize:40,
    fontWeight: FontWeight.w300
  ),
  bodyText1: GoogleFonts.lato(
    color: darkShrinePink,
    fontSize: 20,
  )
)
);