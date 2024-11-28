import 'package:flutter/material.dart';

import '../../../constant.dart';

class HowToUsedScreen extends StatelessWidget {
  const HowToUsedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("How to Used!"),
      ),
    );
  }
}
