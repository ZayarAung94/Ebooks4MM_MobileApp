// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      coverImg: json['coverImg'] as String,
      fileUrl: json['fileUrl'] as String? ?? "",
      demoUrl: json['demoUrl'] as String? ?? "",
      price: (json['price'] as num).toInt(),
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      summary: json['summary'] as String? ?? "",
      categorys: (json['categorys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      awards:
          (json['awards'] as List<dynamic>?)?.map((e) => e as String).toList(),
      distributers: (json['distributers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'authors': instance.authors,
      'coverImg': instance.coverImg,
      'fileUrl': instance.fileUrl,
      'demoUrl': instance.demoUrl,
      'price': instance.price,
      'sold': instance.sold,
      'summary': instance.summary,
      'categorys': instance.categorys,
      'tags': instance.tags,
      'awards': instance.awards,
      'distributers': instance.distributers,
    };
