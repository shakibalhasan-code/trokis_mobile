import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStartingLocationController extends GetxController {
  ///user_data
  var selectedFloorLevel = 2.obs;
  var selectedDate = 'Select Date'.obs;
  var selectedTime = 'Select Time'.obs;

  /// List of location types
  List<String> locationTypes = [
    'Location Type',
    'House',
    'Apartment',
    'Office/Retail Space',
    'First floor',
    'Farm House',
    'Other'
  ];

  /// List of elevator types
  List<String> elevatorTypes = [
    'Is there any elevator',
    'Freight elevator',
    'Normal elevator',
    'No elevator',
    'Supermarket Chain/Mall',
    'Farm house',
    'Stairs are wide',
    'Stairs are narrow'
  ];

  /// List of parking types
  List<String> parkingTypes = [
    'Parking Type',
    'Garage Parking',
    'Street Parking',
    'Dedicated Parking Space',
    'Supermarket Chain/Mall',
    'Farm house',
    'Other'
  ];

  /// Reactive selected values
  var selectedLocationType = 'Location Type'.obs;
  var selectedElevatorType = 'Is there any elevator'.obs;
  var selectedParkingType = 'Parking Type'.obs;

  /// Controllers for text input fields
  var destinationAddressController = TextEditingController();
  var secondAddressController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

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
