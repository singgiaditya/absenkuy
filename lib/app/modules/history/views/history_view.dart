import 'package:absenkuy/app/global/custom_widget/custom_card.dart';
import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global/theme/my_color.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Riwayat',
            style: headingTextStyle,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Obx(() => CustomDatePicker(
                  onTap: controller.selectDate,
                  contextPage: context,
                  date: controller.date.value,
                )),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CustomCard(
                color: primaryClr,
                text1: "Absen Masuk",
                text2: "Tepat Waktu",
                text3: "07:02");
          },
        ));
  }
}

class CustomDatePicker extends StatelessWidget {
  final void Function(BuildContext) onTap;
  final BuildContext contextPage;
  final DateTime date;
  const CustomDatePicker({
    super.key,
    required this.onTap,
    required this.contextPage,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 8),
      child: GestureDetector(
        onTap: () => onTap(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${date.day}/${date.month}/${date.year}",
              style: titleTextStyle.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 24.0,
            )
          ],
        ),
      ),
    );
  }
}
