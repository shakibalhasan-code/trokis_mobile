import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BigItemController extends GetxController {
  final destinationAddressController = TextEditingController();
  RxString selectedTime = 'Now'.obs; // To track the time selection
  RxBool selectedCargo =
      true.obs; // To track the cargo loading/unloading selection

  var currentSection = 'transportation'.obs;

  var isShowMovers = true.obs;
}
