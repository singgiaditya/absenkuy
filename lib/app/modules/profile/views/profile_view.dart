import 'package:absenkuy/app/global/controller/auth_controller.dart';
import 'package:absenkuy/app/global/theme/my_color.dart';
import 'package:absenkuy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController authC = Get.find<AuthController>();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            height: 120,
            width: Get.mediaQuery.size.width,
            color: primaryClr,
            child: Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        )))),
          ),
          FutureBuilder(
            future: authC.getDataUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }

              if (snapshot.hasError) {
                return Center(child: Text("Something error, please check your internet connection", style: titleTextStyle,),);
              }

              return Center(
                child: Container(
                  transform: Matrix4.translationValues(0, -60, 0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(snapshot.data!.image!.isEmpty  ? "assets/images/blank-profile.png" : "${snapshot.data?.image}"),
                  ),
                ),
              );
            }
          ),
          Center(
            child: Container(
              transform: Matrix4.translationValues(0, -60, 0),
              child: Column(
                children: [
                  Text(
                    "Singgi Aditya Ramadhan",
                    style: headingTextStyle,
                  ),
                  Text("XII-MIA 3", style: subTitleTextStyle),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: cardHeadingTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          "msinggiadityaramadhan@gmail.com",
                          style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "No. Telepon",
                          style: cardHeadingTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          "082228040463",
                          style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Alamat",
                          style: cardHeadingTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          "Jl. Candi VB, Karang Besuki, Sukun, Malang",
                          style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Tanggal Lahir",
                          style: cardHeadingTextStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          "28-10-2003",
                          style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                Map<String, dynamic> hasil = await authC.logout();
                                if (hasil["error"] == true) {
                                  Get.snackbar("Error", hasil["message"]);
                                }else{
                                  Get.offAllNamed(Routes.LOGIN);
                                }
                              },
                              child: Text(
                                "Logout",
                                style: subTitleTextStyle.copyWith(
                                    color: primaryClr),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: BorderSide(color: primaryClr))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
