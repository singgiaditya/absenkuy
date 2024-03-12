import 'package:absenkuy/app/data/model/guru.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                SizedBox(
                  height: 14,
                ),
                TextField(
                  onChanged: (value) {
                    controller.filterGuru(value);
                  },
                  style: normalTextStyle.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: Color.fromARGB(255, 247, 246, 251),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none),
                    hintText: "nama guru atau mata pelajaran",
                    hintStyle: normalTextStyle.copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                FutureBuilder(
                  future: controller.getDataGuru(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Obx(() => ListView.builder(
                          itemCount: controller.filterListGuru.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return TeacherCard(
                                data: controller.filterListGuru.elementAt(index));
                          },
                        ));
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class TeacherCard extends StatelessWidget {
  final Guru data;
  const TeacherCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("${data.image}"),
              radius: 28,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.nama}",
                  style: cardHeadingTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  "${data.mapel}",
                  style: cardRegularTextStyle.copyWith(
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "${data.telepon}",
                  style: cardRegularTextStyle.copyWith(
                      fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
