import 'package:ebooks4mm/models/book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookController {
  final SupabaseClient _client = Supabase.instance.client;

  Future<Book> getBook() async {
    final book = await _client.from('books').select('*').eq('id', 2).single();

    return Book.fromJson(book);
  }
}
