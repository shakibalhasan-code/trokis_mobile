import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:trokis_mobile/controller/auth_controller.dart';
import 'package:trokis_mobile/controller/user_app_controller/home_controller.dart';
import 'package:trokis_mobile/controller/tab_controller.dart';
import 'package:trokis_mobile/controller/user_app_controller/item_selection_controller.dart';
import 'package:trokis_mobile/controller/user_app_controller/movers_controller.dart';
import 'package:trokis_mobile/controller/user_app_controller/user_starting_location_controller.dart';
import 'package:trokis_mobile/core/services/map_services.dart';
import 'package:trokis_mobile/views/screens/user/item_selection/item_selections_screen.dart';

class AppBinding {
  static Bindings appBinding = BindingsBuilder(() {
    Get.lazyPut(() => MyTabController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => MapServices(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => UserStartingLocationController(), fenix: true);
    Get.lazyPut(() => ItemSelectionController(), fenix: true);
    Get.lazyPut(() => MoversController(), fenix: true);
  });
}
