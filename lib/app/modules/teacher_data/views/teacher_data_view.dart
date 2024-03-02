import 'package:absenkuy/app/global/theme/my_text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_data_controller.dart';

class TeacherDataView extends GetView<TeacherDataController> {
  const TeacherDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Guru',
            style: headingTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              SizedBox(height: 14,),
              TextField(
                style: normalTextStyle.copyWith(fontSize: 12),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 20),
                  filled: true,
                  fillColor: Color.fromARGB(255, 247, 246, 251),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none
                  ),
                  hintText: "nama guru atau mata pelajaran",
                  hintStyle: normalTextStyle.copyWith(fontSize: 12),
                ),
              ),
              SizedBox(height: 14,),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return TeacherCard();
              },)
            ],
          ),
        ));
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical:14),
        child: Row(
          children: [
            CircleAvatar(radius: 28,),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Iyuz Mariyuz S.Kom", style: cardHeadingTextStyle.copyWith(fontSize: 12),),
                Text("Matematika", style: cardRegularTextStyle.copyWith(fontWeight: FontWeight.w300),),
                Text("08123658048", style: cardRegularTextStyle.copyWith(fontWeight: FontWeight.w300),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
