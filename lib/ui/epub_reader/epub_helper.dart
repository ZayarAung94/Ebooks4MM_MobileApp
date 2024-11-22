import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EpubHelper {
  static Future<EpubBook> getBook() async {
    final byteData = await rootBundle.load("assets/books/testbook.epub");
    final bytes = byteData.buffer.asUint8List();
    EpubBook book = await EpubReader.readBook(bytes);

    return book;
  }

  static List<String> splitTextIntoPages(String text, int maxCount) {
    List<String> result = [];
    int start = 0;

    while (start < text.length) {
      // Determine the end index for the current chunk
      int end = (start + maxCount < text.length) ? start + maxCount : text.length;

      // Adjust the end index to avoid breaking a word
      if (end < text.length && text[end] != ' ') {
        int lastSpace = text.lastIndexOf(' ', end);
        if (lastSpace > start) {
          end = lastSpace;
        }
      }

      String minText = text.substring(start, end).trim();

      minText = "<p>$minText</p>";

      // Add the chunk and move the start pointer
      result.add(minText);
      start = end + 1; // Skip the space after the chunk
    }

    return result;
  }

  static int getMixCharCount() {
    // Get screen dimensions
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

    // Define text style
    const TextStyle textStyle = TextStyle(fontSize: 16);

    // Measure a single character's width and height
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: "W", style: textStyle), // Example widest character
      textDirection: TextDirection.ltr,
    )..layout();

    final double charWidth = textPainter.size.width;
    final double charHeight = textPainter.size.height;

    // Calculate max characters per line and max lines per screen
    final int maxCharsPerLine = (screenWidth / charWidth).floor();
    final int maxLines = (screenHeight / charHeight).floor();
    final int maxChars = maxCharsPerLine * (maxLines + 1);

    return maxChars;
  }
}
