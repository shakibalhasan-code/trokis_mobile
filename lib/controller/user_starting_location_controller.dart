import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserStartingLocationController extends GetxController {
  /// List of location types
  List<String> locationTypes = [
    'House',
    'Apartment',
    'Office/Retail Space',
    'First floor',
    'Farm House',
    'Other'
  ];

  /// List of elevator types
  List<String> elevatorTypes = [
    'Freight elevator',
    'Normal elevator',
    'No elevator',
    'Supermarket Chain/Mall',
    'Farm house',
    'Stairs are wide',
    'Stairs are narrow'
  ];

  /// Create elevator-type variable
  var selectedLocationType = 'House'.obs; // Default value
  var selectedElevatorType = 'Freight elevator'.obs; // Default value

  /// Controllers for text editing UI
  var destinationAddressController = TextEditingController();
  var secondAdressController = TextEditingController();
}
