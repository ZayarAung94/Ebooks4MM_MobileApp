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

  static List<String> splitTextIntoPages(String htmlString, int charLimit) {
    List<String> result = [];
    StringBuffer currentChunk = StringBuffer();
    int visibleCharCount = 0;
    bool insideTag = false;

    for (int i = 0; i < htmlString.length; i++) {
      String char = htmlString[i];

      // Detect start of an HTML tag
      if (char == '<') {
        insideTag = true;
      }

      // Detect end of an HTML tag
      if (char == '>') {
        insideTag = false;
      }

      // Add the current character to the current chunk
      currentChunk.write(char);

      // If outside an HTML tag, count visible characters
      if (!insideTag && char.trim().isNotEmpty) {
        visibleCharCount++;
      }

      // If a space is encountered and we are at or beyond the limit
      if (char == ' ' && visibleCharCount >= charLimit) {
        result.add("<p>${currentChunk.toString().trim()}</p>");
        currentChunk.clear();
        visibleCharCount = 0;
      }
    }

    // Add any remaining chunk
    if (currentChunk.isNotEmpty) {
      result.add("<p>${currentChunk.toString().trim()}</p>");
    }

    return result;
  }

  static int getMixCharCount(TextStyle textStyle) {
    // Get screen dimensions
    final double screenWidth = Get.width;
    final double screenHeight = Get.height;

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
    final int maxChars = maxCharsPerLine * (maxLines + 5);

    return maxChars;
  }
}
