// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      remember_token: json['remember_token'] as String?,
      roleId: json['roleId'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'password': instance.password,
      'avatar': instance.avatar,
      'remember_token': instance.remember_token,
      'roleId': instance.roleId,
      'role': instance.role,
      'addresses': instance.addresses,
    };
