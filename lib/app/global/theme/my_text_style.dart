import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get headingTextStyle {
  return GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle get titleTextStyle{
  return GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);
}

TextStyle get subTitleTextStyle{
  return GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
}

TextStyle get cardHeadingTextStyle{
  return GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);
}

TextStyle get cardRegularTextStyle{
  return GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600);
}

TextStyle get normalTextStyle {
  return GoogleFonts.poppins();
}

TextStyle get alertTextstyle{
  return GoogleFonts.poppins(fontSize: 8, color: const Color.fromARGB(255, 249, 96, 96));
}