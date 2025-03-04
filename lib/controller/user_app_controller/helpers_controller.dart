import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HelpersController extends GetxController {
  var locationController = TextEditingController();
  var address2Controller = TextEditingController();
  var helpersNeedController = TextEditingController();
  var jobDurationController = TextEditingController();
  var offerPerHelperController = TextEditingController();
  var detailsController = TextEditingController();
  var payHelperController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  /// List of location types
  List<String> helpForList = [
    'Moving',
    'Cleaning',
    'Loading and unloading goods',
    'Inventories',
    'Other'
  ];

  ///list of payment-method
  List<String> paymentMethodList = ['Cash', 'Transfer', 'Card'];
  var selectedPaymentMethod = 'Cash'.obs;

  var selectedHhelpFor = 'Moving'.obs;

  ///value for date-time
  var selectedDate = 'Select Date'.obs;
  var selectedTime = 'Select Time'.obs;

  Future<DateTime?> selectDate() {
    return showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
  }

  Future<void> selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      formatTime(pickedTime);
    }
  }

  /// 🔥 Function to format `TimeOfDay` as `hh:mm a` (AM/PM format)
  void formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    selectedTime.value = TimeOfDay.fromDateTime(dt).format(Get.context!);
  }
}
