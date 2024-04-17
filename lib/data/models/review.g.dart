// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as int?,
      reviewer_id: json['reviewer_id'] as int?,
      product_id: json['product_id'] as int?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'reviewer_id': instance.reviewer_id,
      'product_id': instance.product_id,
      'rating': instance.rating,
    };
