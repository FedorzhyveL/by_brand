import 'package:by_brand/domain/models/categorie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final int? id;
  final int? seller_id;
  final String? name;
  final String? description;
  final int? price;
  final int? quantity;
  final int? sale;
  final List<Categorie?>? categories;

  Product({
    this.id,
    this.seller_id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.sale,
    this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    int? id,
    int? seller_id,
    String? name,
    String? description,
    int? price,
    int? quantity,
    int? sale,
    List<Categorie>? categories,
  }) {
    return Product(
      id: id ?? this.id,
      seller_id: seller_id ?? this.seller_id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      sale: sale ?? this.sale,
      categories: categories ?? this.categories,
    );
  }
}
