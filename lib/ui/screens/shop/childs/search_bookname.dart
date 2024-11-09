import 'package:ebooks4mm/ui/constant.dart';
import 'package:flutter/material.dart';

class SearchByBookName extends StatelessWidget {
  const SearchByBookName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: const Text(
          "Search by Book's Name",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
