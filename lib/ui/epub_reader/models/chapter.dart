class MainChapter {
  final String title;
  final int link;
  final List<SubChapter> sub;

  MainChapter({required this.title, required this.link, required this.sub});
}

class SubChapter {
  final String title;
  final int link;

  SubChapter({required this.title, required this.link});
}
