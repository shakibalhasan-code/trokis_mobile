import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:trokis_mobile/controller/auth_controller.dart';
import 'package:trokis_mobile/controller/home_controller.dart';
import 'package:trokis_mobile/controller/tab_controller.dart';
import 'package:trokis_mobile/controller/user_starting_location_controller.dart';
import 'package:trokis_mobile/core/services/map_services.dart';

class AppBinding {
  static Bindings appBinding = BindingsBuilder(() {
    Get.lazyPut(() => MyTabController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MapServices());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UserStartingLocationController());
  });
}
