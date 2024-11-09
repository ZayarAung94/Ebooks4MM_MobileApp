import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/screens/shop/components/book_search.dart';
import 'package:ebooks4mm/ui/widgets/books_group.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const BooksGroup(title: 'Best Seller'),
          const BooksGroup(title: 'Last Update'),
          const BooksGroup(title: 'Promotions'),
          const BooksGroup(title: 'Free Books'),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
