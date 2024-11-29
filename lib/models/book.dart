import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final int id;
  final String name;
  final List<String> authors;
  final String coverImg;
  final String fileUrl;
  final String demoUrl;
  final int price;
  final int sold;
  final String summary;
  final List<String>? categorys;
  final List<String>? tags;
  final List<String>? awards;
  final List<String>? distributers;

  Book({
    required this.id,
    required this.name,
    required this.authors,
    required this.coverImg,
    this.fileUrl = "",
    this.demoUrl = "",
    required this.price,
    this.sold = 0,
    this.summary = "",
    this.categorys,
    this.tags,
    this.awards,
    this.distributers,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
