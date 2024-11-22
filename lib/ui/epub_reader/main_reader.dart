import 'package:ebooks4mm/ui/constant.dart';
import 'package:ebooks4mm/ui/epub_reader/components/bookmark.dart';
import 'package:ebooks4mm/ui/epub_reader/components/view_control.dart';
import 'package:ebooks4mm/ui/epub_reader/epub_helper.dart';
import 'package:ebooks4mm/ui/epub_reader/models/chapter.dart';
import 'package:ebooks4mm/ui/widgets/loading_helper.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class MainReader extends StatefulWidget {
  const MainReader({super.key});

  @override
  State<MainReader> createState() => _MainReaderState();
}

class _MainReaderState extends State<MainReader> {
  bool isLoading = true;
  String bookTitle = "Loading...";

  List<EpubChapter> epubChapters = [];
  List<String> pages = [];
  List<MainChapter> chapters = [];

  final PageController _pageController = PageController();

  Future loadEpub() async {
    epubChapters = [];
    pages = [];
    chapters = [];
    await Future.delayed(Duration(seconds: 1));

    EpubBook epubBook = await EpubHelper.getBook();
    bookTitle = epubBook.Title ?? "";

    int charCount = EpubHelper.getMixCharCount();

    // Access the table of contents
    List<EpubChapter>? toc = epubBook.Chapters;

    // Print the TOC
    if (toc != null) {
      for (EpubChapter chapter in toc) {
        List<SubChapter> subs = [];

        if (chapter.SubChapters!.isEmpty) {
          chapters.add(
            MainChapter(
              title: '${chapter.Title}',
              link: pages.length,
              sub: [],
            ),
          );
        } else {
          chapter.SubChapters?.forEach((subChapter) {
            subs.add(
              SubChapter(
                title: '${subChapter.Title}',
                link: pages.length,
              ),
            );

            MainChapter main = MainChapter(
              title: '${chapter.Title}',
              link: pages.length,
              sub: subs,
            );

            chapters.add(main);
          });
        }

        List<String> p = EpubHelper.splitTextIntoPages(chapter.HtmlContent!, charCount);
        pages.addAll(p);
      }
    }

    return epubBook;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadEpub(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: epubAppBar(context),
            drawer: drawer(),
            body: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        // child: Text(pages[index]),
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
                            if (element.localName == "h1") {
                              return {
                                'font-size': '18px',
                                'text-align': 'center',
                              };
                            }
                            if (element.localName == "h2" || element.localName == "h3") {
                              return {
                                'font-size': '15px',
                              };
                            }
                            if (element.localName == "title") {
                              return {
                                'display': 'none',
                              };
                            }
                            return null;
                          },
                          enableCaching: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${index + 1} of ${pages.length + 1}"),
                          Text("${(100 * index / pages.length).round()} %"),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: AppLoading.fullPageLoading(),
          );
        }
      },
    );
  }

  Drawer drawer() {
    return Drawer(
      width: Get.size.width * 0.9,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  MainChapter chapter = chapters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            _pageController.jumpToPage(chapter.link);
                            Get.back();
                          },
                          child: Text(
                            chapter.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: chapter.sub.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  _pageController.jumpToPage(chapter.sub[index].link);
                                  Get.back();
                                },
                                child: Text(
                                  chapter.sub[index].title,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar epubAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}
