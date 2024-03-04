import 'package:absenkuy/app/data/model/guru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TeacherDataController extends GetxController {
  final db = FirebaseFirestore.instance;

  List<Guru> listGuru = [];

  Future<void> getDataGuru() async {
    await db.collection("users").get().then((event) {
      List<Guru> dataGuru = [];
      for (var doc in event.docs) {
        dataGuru.add(Guru.fromJson(doc.data()));
      }
      listGuru = dataGuru;
    });
  }
}
