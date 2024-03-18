import 'package:absenkuy/app/global/controller/auth_controller.dart';
import 'package:absenkuy/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/global/theme/my_theme.dart';
import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: "absenkuy");
  Get.put(AuthController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Loading();
        }
        return GetMaterialApp(
          title: "AbsenKuy",
          initialRoute: snapshot.hasData ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
          theme: Themes.light,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
