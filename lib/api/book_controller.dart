import 'package:ebooks4mm/models/book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../temp_data/books.dart';

class BookController {
  final SupabaseClient _client = Supabase.instance.client;

  Future<Book> getBook() async {
    final book = await _client.from('books').select('*').eq('id', 2).single();

    return Book.fromJson(book);
  }

  Future loadBooks() async {
    if (TempBooks.lastBooks.isEmpty) {
      TempBooks.lastBooks = await BookController().getLastBooks();
    }

    if (TempBooks.bestSeller.isEmpty) {
      TempBooks.bestSeller = await BookController().getBestSeller();
    }

    if (TempBooks.promotions.isEmpty) {
      TempBooks.promotions = await BookController().getPromotions();
    }

    if (TempBooks.freeBooks.isEmpty) {
      TempBooks.freeBooks = await BookController().getLastBooks();
    }
  }

  Future<List<Book>> getLastBooks() async {
    final books = await _client.from('books').select().order('id').range(0, 9);

    List<Book> result = [];

    for (var book in books) {
      result.add(Book.fromJson(book));
    }

    return result;
  }

  Future<List<Book>> getBestSeller() async {
    final result = await _client.from('books').select().order("price").range(0, 9);

    List<Book> books = [];

    for (var book in result) {
      books.add(Book.fromJson(book));
    }

    return books;
  }

  Future<List<Book>> getPromotions() async {
    final result = await _client.from('books').select().order("price", ascending: true).range(0, 9);

    List<Book> books = [];

    for (var book in result) {
      books.add(Book.fromJson(book));
    }

    return books;
  }
}
