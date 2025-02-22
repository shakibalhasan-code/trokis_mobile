import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var userPhoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userPhoneNumberController.dispose();
    userPhoneNumberController.clear();

    super.dispose();
  }
}
