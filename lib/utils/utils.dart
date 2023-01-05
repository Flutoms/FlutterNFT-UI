import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle globalTextStyle(
    {Color color = Colors.white70, FontWeight? fontWeight, double? fontSize}) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
  );
}

Color darkColor = const Color(0xff2C313F);
Color lightColor = const Color(0xff495163);
Color blueColor = const Color(0xff3000ff);
