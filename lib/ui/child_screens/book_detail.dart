import 'package:ebooks4mm/temp_data/books.dart';
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
                    width: 150,
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
                        dataRow("Price", "${book.price} Ks"),
                        dataRow("Sold", "${book.sold}"),
                        SizedBox(height: 10),
                        ratingWidget()
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
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                  )
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
                  Text(
                    book.summary,
                    style: TextStyle(height: 1.5),
                  ),
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
            BooksGroup(
              title: "Relative Books",
              books: TempBooks.lastBooks,
            )
          ],
        ),
      ),
    );
  }

  Widget ratingWidget() {
    return Column(
      children: [
        ratingRow(star: 5, count: "12"),
        ratingRow(star: 2, count: "5"),
        ratingRow(star: 1, count: '2'),
      ],
    );
  }

  Row ratingRow({
    required int star,
    String? count,
  }) {
    return Row(
      children: [
        Icon(star > 0 ? Icons.star : Icons.star_outline, size: 14),
        Icon(star > 1 ? Icons.star : Icons.star_outline, size: 14),
        Icon(star > 2 ? Icons.star : Icons.star_outline, size: 14),
        Icon(star > 3 ? Icons.star : Icons.star_outline, size: 14),
        Icon(star > 4 ? Icons.star : Icons.star_outline, size: 14),
        SizedBox(width: 10),
        Text(
          count ?? "0",
          style: TextStyle(fontSize: 12),
        ),
      ],
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
