import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldText {
  static TextStyle nameOfTextStyle = GoogleFonts.poppins(
      fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
}

class LightText {
  static TextStyle nameOfTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: Colors.black,
  );
}

class BoldHeading {
  static TextStyle nameOfTextStyle = GoogleFonts.poppins(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
}
