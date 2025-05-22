import 'package:epubx/epubx.dart' as epubx;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../epub_reader/epub_helper.dart';
import '../../epub_reader/main_reader.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<epubx.EpubBook> loadEpub() async {
      epubx.EpubBook epubBook = await EpubHelper.getBook();

      return epubBook;
    }

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: loadEpub(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    epubx.EpubBook? book = snap.data;
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            Get.to(() => MainReader());
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
                                        "${book!.Title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "MyanmarSabae",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "${book.Author}",
                                        style: TextStyle(
                                          fontFamily: "MyanmarSabae",
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      dataRow("Rating", "5/5"),
                                      dataRow("Price", "2,000 K"),
                                      dataRow("Reading Progress", "80%"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text("Loading..."));
                  }
                },
              ),
            )
          ],
        ),
      ],
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
