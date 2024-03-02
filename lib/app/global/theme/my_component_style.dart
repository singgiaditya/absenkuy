import 'package:flutter/material.dart';

import 'my_color.dart';

AppBarTheme myAppBarStyle() => const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: primaryClr,
      elevation: 0,
    );

ElevatedButtonThemeData myElevatedButtonThemeStyle() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        backgroundColor: MaterialStateProperty.all<Color>(primaryClr)),
  );}

  IconThemeData myIconStyle() => const IconThemeData(color: primaryClr);