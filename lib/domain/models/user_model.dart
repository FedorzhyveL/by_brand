import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum Role {
  ADMIN,
  SELLER,
  WORKER,
  CUSTOMER,
}

@JsonSerializable()
class User {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final bool? isBlocked;
  final UserDetails? userDetails;
  final DateTime? updatedAt;
  final List<UserRole?>? roles;
  final DateTime? verifiedAt;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.isBlocked,
    required this.userDetails,
    required this.updatedAt,
    required this.roles,
    required this.verifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserDetails {
  final DateTime? birtdate;
  final String? firstname;
  final String? surname;
  final String? phone;
  final bool? sex;

  UserDetails({
    required this.birtdate,
    required this.firstname,
    required this.surname,
    required this.phone,
    required this.sex,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable()
class UserRole {
  final Role name;

  UserRole({required this.name});

  factory UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
