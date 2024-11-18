import 'package:ebooks4mm/ui/epub_reader/components/bookmark.dart';
import 'package:ebooks4mm/ui/epub_reader/components/content.dart';
import 'package:ebooks4mm/ui/epub_reader/components/view_control.dart';
import 'package:ebooks4mm/ui/epub_reader/epub_helper.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

class MainReader extends StatelessWidget {
  const MainReader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EpubHelper.getBook(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          EpubBook book = snap.data as EpubBook;

          List<String> chapterTitle = [];
          List<String> chapterContent = [];

          for (var chapter in book.Chapters!) {
            if (chapter.Title != null) chapterTitle.add(chapter.Title!);

            if (chapter.HtmlContent != null) chapterContent.add(chapter.HtmlContent!);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "${book.Title}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return const ViewControl();
                      },
                    );
                  },
                  icon: Icon(Icons.font_download),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor: 0.87,
                          child: const BookmarkSheet(),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.book),
                ),
                SizedBox(width: 20)
              ],
            ),
            drawer: TableOfContents(
              table: chapterTitle,
            ),
            body: SingleChildScrollView(
              child: Text(chapterContent[1]),
            ),
          );
        }
        return Center(
          child: Text("Loading..."),
        );
      },
    );
  }
}
