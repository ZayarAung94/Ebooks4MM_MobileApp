// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      device: json['device'] as String? ?? "",
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      own_books: (json['own_books'] as num?)?.toInt() ?? 0,
      finished_books: (json['finished_books'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'device': instance.device,
      'balance': instance.balance,
      'own_books': instance.own_books,
      'finished_books': instance.finished_books,
    };
