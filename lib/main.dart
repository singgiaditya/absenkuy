import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/global/theme/my_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "AbsenKuy",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.light,
      themeMode: ThemeMode.light,
    ),
  );
}
