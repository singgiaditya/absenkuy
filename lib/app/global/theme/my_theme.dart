import 'package:flutter/material.dart';

import 'my_color.dart';
import 'my_component_style.dart';

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
    primaryColor: primaryClr,
    brightness: Brightness.light,
    elevatedButtonTheme: myElevatedButtonThemeStyle(),
    appBarTheme: myAppBarStyle(),
    iconTheme: myIconStyle()
  );

  
}