import 'package:ebooks4mm/database/book_controller.dart';
import 'package:ebooks4mm/temp_data/books.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/screens/shop/components/book_search.dart';
import 'package:ebooks4mm/ui/widgets/books_group.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:ebooks4mm/ui/widgets/loading_helper.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BookController().loadBooks(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 10,
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AppBtn.expendedBtn(
                      color: AppColors.assent,
                      label: "Book Search",
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return const BookSearch();
                          },
                        );
                      },
                    ),
                  ),
                  BooksGroup(
                    title: 'Best Seller',
                    books: TempBooks.bestSeller,
                  ),
                  BooksGroup(
                    title: 'Last Update',
                    books: TempBooks.lastBooks,
                  ),
                  BooksGroup(
                    title: 'Promotions',
                    books: TempBooks.promotions,
                  ),
                  BooksGroup(
                    title: 'Free Books',
                    books: TempBooks.freeBooks,
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            );
          } else {
            return AppLoading.fullPageLoading();
          }
        });
  }
}
