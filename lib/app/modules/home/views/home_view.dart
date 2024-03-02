import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../global/constants/svgs.dart';
import '../../../global/theme/my_color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, top: 24, bottom: 100),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 49, 49),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12))),
            child: SafeArea(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.PROFILE),
                      child: CircleAvatar(
                    backgroundColor: Colors.red,
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "M. Singgi Aditya Ramadhan",
                        style: subTitleTextStyle.copyWith(color: Colors.white),
                      ),
                      Text("XII-MIA 3",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.white70))
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, -80, 0),
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryClr,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                margin: const EdgeInsets.all(4),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Absen masuk jam 07:00 - 08:00",
                      style: cardRegularTextStyle.copyWith(
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 74,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Svgs.icAbsen),
                                  Text(
                                    "Absen",
                                    style: normalTextStyle.copyWith(
                                        fontWeight: FontWeight.w600, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Row(
                          children: [
                            CountInfo(
                              color: greenClr,
                              number: 14,
                              text: "Masuk",
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CountInfo(
                              color: yellowClr,
                              number: 14,
                              text: "Telat",
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CountInfo(
                              color: blueClr,
                              number: 14,
                              text: "Izin",
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            CountInfo(
                              color: primaryClr,
                              number: 14,
                              text: "Alpha",
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Kamu belum absen hari ini",
                      style: alertTextstyle,
                    )
                  ],
                ),
              )),
          Container(
            transform: Matrix4.translationValues(0, -60, 0),
            child: GridView.count(
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 14),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: const [
                CustomButton(
                  icons: Svgs.icCalendar,
                  text: "Jadwal Kelas",
                  route: Routes.CLASS_SCHEDULE,
                ),
                CustomButton(
                    icons: Svgs.icHistory,
                    text: "Riwayat",
                    route: Routes.HISTORY),
                CustomButton(
                    icons: Svgs.icDocument,
                    text: "Rekap Nilai",
                    route: Routes.REKAP_NILAI),
                CustomButton(
                    icons: Svgs.icBriefcase,
                    text: "Data Guru",
                    route: Routes.TEACHER_DATA),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String icons;
  final String text;
  final String route;
  const CustomButton({
    super.key,
    required this.icons,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(route);
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icons),
          const SizedBox(
            height: 4,
          ),
          Text(
            text,
            style: normalTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 249, 96, 96)),
          )
        ],
      ),
    );
  }
}

class CountInfo extends StatelessWidget {
  final Color color;
  final int number;
  final String text;

  const CountInfo({
    super.key,
    required this.color,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 65,
      width: 40,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$number",
            style: normalTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          Text(text,
              style: alertTextstyle.copyWith(color: Colors.white, fontSize: 7))
        ],
      ),
    );
  }
}
