import 'package:ebooks4mm/models/profile/profile.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color.fromRGBO(13, 38, 69, 1);
  static const Color softBg = Color.fromRGBO(30, 50, 73, 1);
  static const Color assent = Colors.deepOrangeAccent;
}

class MyText {
  static String long =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
}

class AppData {
  static String userName = "AZ Demon AZ Demon AZ Demon AZ Demon";
  static String email = "azdemon@mail.com";
  static String phone = "+95 9 405030798";
  static String balance = "100,000";
  static String activeDevice = "Huewei P30 Lite";

  static Profile? user;

  static String mmFont = "MyanmarSabae";
}
