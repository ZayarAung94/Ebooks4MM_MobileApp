import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/widgets/books_group.dart';
import 'package:ebooks4mm/ui/widgets/btn_helper.dart';
import 'package:ebooks4mm/ui/widgets/text_helper.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    width: 170,
                    height: 200,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "Book's Title Book's Title Book's Title Book's Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Writers Name",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        dataRow("Price", "20,000 K"),
                        dataRow("Sold", "10,000"),
                        dataRow("File Size", "1.5 MB"),
                        SizedBox(height: 10),
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
                  Text(MyText.long),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.header1("Acivement"),
                  const SizedBox(height: 8),
                  const Text("Best Books of the year (2019)"),
                ],
              ),
            ),
            bookData("Book's Category", "Novel, Translste, History, ..."),
            bookData("Distributer", "Shwe Mee Eain"),
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
