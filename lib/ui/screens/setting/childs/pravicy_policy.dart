import 'package:flutter/material.dart';

import '../../../constant.dart';

class PravicyPolicyScreen extends StatelessWidget {
  const PravicyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("Pravicy Policy"),
      ),
    );
  }
}
