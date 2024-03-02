import 'package:get/get.dart';

import '../controllers/class_schedule_controller.dart';

class ClassScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassScheduleController>(
      () => ClassScheduleController(),
    );
  }
}
