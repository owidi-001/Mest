// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      author: json['author'] as String,
      ISBN: json['ISBN'] as String,
      price: (json['price'] as num).toDouble(),
      pages: json['pages'] as int,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'ISBN': instance.ISBN,
      'price': instance.price,
      'pages': instance.pages,
    };
