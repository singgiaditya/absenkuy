import 'package:get/get.dart';

import '../controllers/teacher_data_controller.dart';

class TeacherDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDataController>(
      () => TeacherDataController(),
    );
  }
}
