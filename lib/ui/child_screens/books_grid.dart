import 'package:ebooks4mm/temp_data/books.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/books_card.dart';

class BooksGrid extends StatelessWidget {
  const BooksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          "Order by Last Update",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.58, // height relative to width
        ),
        itemCount: TempBooks.lastBooks.length,
        itemBuilder: (context, index) {
          final book = TempBooks.lastBooks[index];
          return BookCard(book: book);
        },
      ),
    );
  }
}
