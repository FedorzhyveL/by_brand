import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';

@JsonSerializable()
class Role {
  final int? id;
  final String? role;

  Role({
    this.id,
    this.role,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  Role copyWith({
    int? id,
    String? role,
  }) {
    return Role(
      id: id ?? this.id,
      role: role ?? this.role,
    );
  }
}
