import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/widgets/books_group.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:ebooks4mm/ui/widgets/text_helper.dart';
import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: const Text(
          "Book's Detail",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    width: 170,
                    height: 200,
                    child: Image.network(
                      book.coverImg,
                      fit: BoxFit.fill,
                    ),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          book.authors.first,
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        dataRow("Price", "${book.price} K"),
                        dataRow("Sold", "${book.sold}"),
                        SizedBox(height: 30),
                        AppBtn.normalBtn(
                          color: AppColors.softBg,
                          label: "Add to Watch List",
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppBtn.expendedBtn(
                      color: Colors.green,
                      label: "Buy Book",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppBtn.expendedBtn(
                      color: Colors.deepOrangeAccent,
                      label: "Demo Read",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.header1("Summary"),
                  const SizedBox(height: 8),
                  Text(book.summary),
                ],
              ),
            ),
            if (book.awards != null)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.header1("Awards"),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: book.awards == null ? 0 : book.awards!.length,
                      itemBuilder: (context, index) {
                        String award = book.awards![index];
                        return Text(award);
                      },
                    ),
                  ],
                ),
              ),
            bookData("Book's Category", book.categorys!.join(", ")),
            if (book.distributers != null) bookData("Distributer", "${book.distributers}"),
            const SizedBox(height: 20),
            const Divider(),
            const BooksGroup(title: "Relative Books")
          ],
        ),
      ),
    );
  }

  Padding bookData(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.header1(title),
          const SizedBox(height: 8),
          Text(data),
        ],
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
