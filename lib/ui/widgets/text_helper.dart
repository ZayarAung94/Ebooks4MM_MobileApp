import 'package:flutter/material.dart';

class AppText {
  static Widget header1(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }
}
