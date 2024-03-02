import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final date = DateTime.now().obs;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date.value,
        firstDate: DateTime(2023, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != date.value) {
      date.value = picked;
    }
  }


}
