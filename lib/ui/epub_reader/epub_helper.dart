import 'package:epub_view/epub_view.dart';
import 'package:flutter/services.dart';

class EpubHelper {
  static Future<EpubBook> getBook() async {
    final byteData = await rootBundle.load("assets/books/testbook.epub");
    final bytes = byteData.buffer.asUint8List();
    EpubBook book = await EpubReader.readBook(bytes);

    return book;
  }
}
