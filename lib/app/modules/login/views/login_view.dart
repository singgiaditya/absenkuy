import 'package:absenkuy/app/global/controller/auth_controller.dart';
import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:absenkuy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authC = Get.find<AuthController>();
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back",
            style: headingTextStyle.copyWith(fontSize: 24),
          ),
          Text(
            "Login to continue",
            style: subTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 155, 155, 155)),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Email",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45))),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Password",
            style: titleTextStyle,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45))),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async{
                    Map<String, dynamic> hasil =  await authC.login(controller.emailController.text, controller.passwordController.text);
                    if (hasil["error"] == true) {
                    Get.snackbar("Error", hasil["message"]);
                  } else {
                    Get.offAllNamed(Routes.HOME);
                  }
                  },
                  child: Text(
                    "Login",
                    style: titleTextStyle.copyWith(color: Colors.white),
                  )))
        ],
      ),
    ));
  }
}
