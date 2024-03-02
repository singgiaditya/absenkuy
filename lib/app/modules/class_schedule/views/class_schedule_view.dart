import 'package:absenkuy/app/global/custom_widget/custom_card.dart';
import 'package:absenkuy/app/global/theme/my_color.dart';
import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/class_schedule_controller.dart';

class ClassScheduleView extends GetView<ClassScheduleController> {
  const ClassScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Jadwal Kelas',
            style: headingTextStyle,
          ),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(30), child: Obx(() => CustomDropDown(list: controller.dropdownItems, selectedValue: controller.selectedValue.value, onChange: controller.updateSelectedValue,))),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const CustomCard(color: primaryClr, text1: "07:00 - 08:00", text2: "Matematika", text3: "Iyuz Mariyuz S.Mat");
          },
        ));
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key, required this.list, required this.selectedValue, required this.onChange,
  });

  final List<String> list;
  final String  selectedValue;
  final void Function(String?) onChange;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
      isExpanded: true,
      items: list
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: titleTextStyle.copyWith(fontWeight: FontWeight.w500, color: Colors.white)
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (String? value) {
        onChange(value);
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        width: 140,
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
      iconStyleData: const IconStyleData(
        iconEnabledColor: Colors.white
      ),
      dropdownStyleData: const DropdownStyleData(
        decoration: BoxDecoration(color: primaryClr),
        elevation: 0
      ),
          ),
        ),
    );
  }
}
