import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BigItemController extends GetxController {
  final destinationAddressController = TextEditingController();
  RxString selectedTime = 'Now'.obs; // To track the time selection
  RxBool selectedCargo =
      true.obs; // To track the cargo loading/unloading selection

  ///transportation/finding/accepted
  var currentSection = 'transportation'.obs;

  var isCheckTerms = true.obs;
  var isDeliveryCompleted = false.obs;
  var isShowMovers = true.obs;
}
