import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MoversController extends GetxController {
  List<String> shortingMovers = [
    'By rating',
    'By price',
    'Based on experience',
    'Recently added'
  ];

  var selectedShortingMovers = 'By rating'.obs;
}
