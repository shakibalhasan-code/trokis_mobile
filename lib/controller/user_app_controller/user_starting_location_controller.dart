import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStartingLocationController extends GetxController {
  var selectedFloorLevel = 2.obs;

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

  ///user_data
  var selectedDate = 'Select Date'.obs;
  var selectedTime = 'Select Time'.obs;

  /// Controllers for text input fields
  var destinationAddressController = TextEditingController();
  var secondAddressController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  // Future<DateTime> selectDate() {
  //   return showDatePicker(
  //     context: Get.context!,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2025),
  //   );
  // }
}
