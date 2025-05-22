import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMessage {
  static normal({required String title, required String message}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
      );
    }
  }

  static error(String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        'Opps!!! Something is wrong',
        message,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        duration: const Duration(milliseconds: 3000),
        backgroundColor: Colors.red[200],
        colorText: Colors.white,
      );
    }
  }
}
