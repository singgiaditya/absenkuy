import 'package:get/get.dart';

class ClassScheduleController extends GetxController {
  final List<String> dropdownItems = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jumat"
  ];

  final selectedValue = "".obs;

  @override
  void onInit() {
    // Initialize the selected value with the first item in the dropdownItems
    selectedValue.value = dropdownItems.first;
    super.onInit();
  }

  void updateSelectedValue(String? value){selectedValue.value = value!;}
}
