// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String id;
  final String name;
  final String phone;
  final String email;
  String device;
  int balance;
  int own_books;
  int finished_books;

  Profile({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.device = "",
    this.balance = 0,
    this.own_books = 0,
    this.finished_books = 0,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
