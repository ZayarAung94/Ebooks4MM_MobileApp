import 'package:ebooks4mm/models/book.dart';
import 'package:ebooks4mm/ui/child_screens/book_detail.dart';
import 'package:ebooks4mm/ui/demo_data.dart';
import 'package:ebooks4mm/ui/widgets/books_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../child_screens/books_grid.dart' show BooksGrid;
import 'text_helper.dart';

class BooksGroup extends StatelessWidget {
  final List<Book>? books;
  final String title;

  const BooksGroup({
    super.key,
    required this.title,
    this.books,
  });

  @override
  Widget build(BuildContext context) {
    if (books != null) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.header1(title),
                GestureDetector(
                  onTap: () {
                    Get.to(() => BooksGrid());
                  },
                  child: const Text(
                    "See More >>",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: books!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Book book = books![index];
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0),
                  child: BookCard(book: book),
                );
              },
            ),
          )
        ],
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.header1(title),
              const Text(
                "See More",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.to(
                      () => BookDetail(
                        book: DefaultData.book(),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 170,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Myanmar နာမည် အကောင်းဆုံး",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "Writer Name",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 17,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "1,100 K",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
