import '../models/book.dart';

class DefaultData {
  static book() {
    return Book(
        id: 1,
        name: 'ပါရီကျဆုံးခန်း',
        authors: ['မြသန်းတင့်'],
        coverImg: 'https://cmrvbhtafwmbcgopysmm.supabase.co/storage/v1/object/public/cover_images/1.jpg',
        price: 0,
        categorys: ["ဘာသာပြန်", "ဝတ္ထုရှည်"]);
  }
}
