import 'package:ebooks4mm/models/book.dart';
import 'package:ebooks4mm/ui/child_screens/book_detail.dart';
import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteListScreen extends StatelessWidget {
  const WhiteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> whitelistBooks = [
      Book(
        id: 1,
        name: 'Books Name Books Name Book Name Book Name',
        authors: ["author"],
        coverImg: "",
        price: 10000,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: Text("White List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: whitelistBooks.length,
          itemBuilder: (context, index) {
            Book book = whitelistBooks[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => BookDetail(book: DefaultData.book()));
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      width: 120,
                      height: 150,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            book.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "MyanmarSabae",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.authors[0],
                            style: TextStyle(
                              fontFamily: "MyanmarSabae",
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          dataRow("Rating", "5/5"),
                          dataRow("Price", "${book.price} K"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Row dataRow(String type, String value) {
    return Row(
      children: [
        Text(
          '$type :',
          style: const TextStyle(
            fontWeight: FontWeight.w200,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
