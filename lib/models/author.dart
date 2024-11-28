class Author {
  final String name;
  final int avaliableBooks;
  final int follower;
  final String? about;
  final List<String>? books;
  final List<String>? achivement;

  Author({
    required this.name,
    required this.avaliableBooks,
    this.follower = 0,
    this.about,
    this.books,
    this.achivement,
  });
}
