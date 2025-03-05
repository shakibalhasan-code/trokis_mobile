import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineWaitingController extends GetxController {
  var locationController = TextEditingController();
  var addressLineController = TextEditingController();

  var selectDateController = TextEditingController();
  var selectTimeController = TextEditingController();
  var describeController = TextEditingController();
  var offerController = TextEditingController();

  ///value for date-time
  var selectedDate = 'Select Date'.obs;
  var selectedTime = 'Select Time'.obs;

  List<String> shortingMovers = [
    'Sort By',
    'By Rating',
    'By Price',
    'Based on experience',
    'Recently added'
  ];

  var selectedShortingMovers = 'Sort by'.obs;

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
