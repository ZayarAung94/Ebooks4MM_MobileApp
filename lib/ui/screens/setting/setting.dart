import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10,
            child: SizedBox(
              height: 100,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
