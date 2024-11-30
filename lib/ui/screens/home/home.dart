import 'package:ebooks4mm/database/book_controller.dart';
import 'package:ebooks4mm/temp_data/books.dart';
import 'package:ebooks4mm/ui/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

import '../../widgets/books_group.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BookController().loadBooks(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
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
                  BooksGroup(
                    title: "Last Update Books",
                    books: TempBooks.lastBooks,
                  ),
                  BooksGroup(
                    title: "Best Seller",
                    books: TempBooks.bestSeller,
                  ),
                  BooksGroup(
                    title: "Big Promotions",
                    books: TempBooks.promotions,
                  ),
                  BooksGroup(
                    title: "Free Ebooks",
                    books: TempBooks.freeBooks,
                  ),
                  SizedBox(height: 70),
                ],
              ),
            );
          } else {
            return Center(
              child: AppLoading.fullPageLoading(),
            );
          }
        });
  }
}
