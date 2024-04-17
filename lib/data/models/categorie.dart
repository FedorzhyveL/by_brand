// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'categorie.g.dart';

@JsonSerializable()
class Categorie {
  final int? id;
  final String? name;
  final String? description;

  Categorie({
    this.id,
    this.name,
    this.description,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) => _$CategorieFromJson(json);
  Map<String, dynamic> toJson() => _$CategorieToJson(this);

  Categorie copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Categorie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
