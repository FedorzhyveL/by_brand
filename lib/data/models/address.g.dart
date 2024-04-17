// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      apartment: json['apartment'] as String?,
      zipcode: json['zipcode'] as int?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'street': instance.street,
      'city': instance.city,
      'apartment': instance.apartment,
      'zipcode': instance.zipcode,
      'country': instance.country,
    };
