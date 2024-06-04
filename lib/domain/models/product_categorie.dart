import 'package:json_annotation/json_annotation.dart';

part 'product_categorie.g.dart';

@JsonSerializable()
class ProductCategorie {
  final int? id;
  final String? name;
  final String? description;

  ProductCategorie({
    required this.id,
    required this.name,
    required this.description,
  });
  factory ProductCategorie.fromJson(Map<String, dynamic> json) => _$ProductCategorieFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategorieToJson(this);
}
