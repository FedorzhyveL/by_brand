import 'package:by_brand/domain/models/product_categorie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final int? id;
  final int? sellerId;
  final String? name;
  final int? price;
  final int? quantity;
  final String? description;
  final int? updatedBy;
  final List<ProductCategorie?>? categories;

  Product({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.updatedBy,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
