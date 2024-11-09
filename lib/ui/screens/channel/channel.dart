import 'package:flutter/material.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Card(
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          elevation: 10,
          child: SizedBox(height: 100),
        );
      },
    );
  }
}
