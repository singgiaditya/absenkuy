import 'package:get/get.dart';

import '../modules/class_schedule/bindings/class_schedule_binding.dart';
import '../modules/class_schedule/views/class_schedule_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rekap_nilai/bindings/rekap_nilai_binding.dart';
import '../modules/rekap_nilai/views/rekap_nilai_view.dart';
import '../modules/teacher_data/bindings/teacher_data_binding.dart';
import '../modules/teacher_data/views/teacher_data_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CLASS_SCHEDULE,
      page: () => const ClassScheduleView(),
      binding: ClassScheduleBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_DATA,
      page: () => const TeacherDataView(),
      binding: TeacherDataBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_NILAI,
      page: () => const RekapNilaiView(),
      binding: RekapNilaiBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
