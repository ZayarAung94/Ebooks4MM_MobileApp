import 'package:ebooks4mm/ui/epub_reader/components/bookmark.dart';
import 'package:ebooks4mm/ui/epub_reader/components/content.dart';
import 'package:ebooks4mm/ui/epub_reader/components/view_control.dart';
import 'package:ebooks4mm/ui/epub_reader/epub_helper.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MainReader extends StatefulWidget {
  const MainReader({super.key});

  @override
  State<MainReader> createState() => _MainReaderState();
}

class _MainReaderState extends State<MainReader> {
  bool isLoading = true;
  String bookTitle = "Loading...";
  List<String> chapterContent = [];
  List<String> chapterTitle = [];
  List<String> pages = [];

  Future<void> loadEpub() async {
    EpubBook epubBook = await EpubHelper.getBook();
    bookTitle = epubBook.Title ?? "";

    for (var chapter in epubBook.Chapters!) {
      if (chapter.HtmlContent != null) chapterContent.add(chapter.HtmlContent!);
      if (chapter.Title != null) chapterTitle.add(chapter.Title!);
    }

    try {
      int charCount = EpubHelper.getMixCharCount();

      for (var text in chapterContent) {
        List<String> p = EpubHelper.splitTextIntoPages(text, charCount);
        pages.addAll(p);
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    loadEpub();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bookTitle,
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
      body: isLoading
          ? Center(
              child: Text("Loading"),
            )
          : PageView.builder(
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: HtmlWidget(
                          pages[index],
                          renderMode: RenderMode.listView,
                          customStylesBuilder: (element) {
                            if (element.localName == "p") {
                              return {
                                'font-size': '15px',
                                'line-height': '1.7',
                              };
                            }
                            if (element.localName == "title") {
                              return {
                                'display': 'none',
                              };
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${index + 1}/${pages.length + 1}"),
                          Text("${(100 * index / pages.length).round()} %"),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
