import 'package:ebooks4mm/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../child_screens/book_detail.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool showPrice;
  const BookCard({super.key, required this.book, this.showPrice = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.to(() => BookDetail(book: book));
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
              child: Image.network(
                book.coverImg,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              book.authors.first,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 2),
            if (showPrice)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.deepOrange,
                    size: 17,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${book.price} Ks",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
