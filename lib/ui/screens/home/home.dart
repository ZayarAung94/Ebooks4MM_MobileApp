import 'package:flutter/material.dart';

import '../../widgets/books_group.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.all(8.0),
            elevation: 10,
            child: SizedBox(
              height: 200,
              width: double.infinity,
            ),
          ),
          BooksGroup(title: "Last Update Books"),
          BooksGroup(title: "Best Seller"),
          BooksGroup(title: "Big Promotions"),
          BooksGroup(title: "Free Ebooks"),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
