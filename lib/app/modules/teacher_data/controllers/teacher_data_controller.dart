import 'package:absenkuy/app/data/model/guru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TeacherDataController extends GetxController {
  final db = FirebaseFirestore.instance;

  List<Guru> listGuru = [];
  final filterListGuru = <Guru> [].obs;

  Future<void> getDataGuru() async {
    await db.collection("guru").get().then((event) {
      List<Guru> dataGuru = [];
      for (var doc in event.docs) {
        dataGuru.add(Guru.fromJson(doc.data()));
      }
      listGuru = dataGuru;
      filterListGuru.clear();
      filterListGuru.addAll(dataGuru);
    });
  }

  void filterGuru(String query){
    if (query == "") {
      filterListGuru.clear();
      filterListGuru.addAll(listGuru);
      return;
    }
    filterListGuru.clear();
    for (var guru in listGuru) {
      if (guru.nama!.isCaseInsensitiveContains(query)) {
        filterListGuru.add(guru);
      }else if(guru.mapel!.isCaseInsensitiveContains(query)){
        filterListGuru.add(guru);
      }
    }
  }
}
