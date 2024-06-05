import 'package:by_brand/domain/models/address.dart';
import 'package:by_brand/domain/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? username;
  final String? email;
  final String? email_verified_at;
  final String? password;
  final String? avatar;
  final String? remember_token;
  final int? roleId;
  final Role? role;
  final List<Address?>? addresses;
  User({
    this.id,
    this.username,
    this.email,
    this.email_verified_at,
    this.password,
    this.avatar,
    this.remember_token,
    this.roleId,
    this.role,
    this.addresses,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? email_verified_at,
    String? password,
    String? avatar,
    String? remember_token,
    int? roleId,
    Role? role,
    List<Address>? addresses,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      remember_token: remember_token ?? this.remember_token,
      roleId: roleId ?? this.roleId,
      role: role ?? this.role,
      addresses: addresses ?? this.addresses,
    );
  }
}
