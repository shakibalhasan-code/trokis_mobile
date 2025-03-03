import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MoversController extends GetxController {
  var selectedMoversCategory = 'All'.obs;

  List<String> shortingMovers = [
    'Sort by',
    'By rating',
    'By price',
    'Based on experience',
    'Recently added'
  ];

  List<String> movingCategories = [
    'All',
    'House moving',
    'Office moving',
    'Furniture moving',
    'Piano moving',
    'Pool table moving',
    'Safe moving',
    'Car moving',
    'Motorcycle moving',
    'Boat moving',
    'Pet moving',
    'Art moving',
    'Appliance moving',
  ].obs;

  var selectedShortingMovers = 'Sort by'.obs;
}
