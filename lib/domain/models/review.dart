import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';

@JsonSerializable()
class Review {
  final int? id;
  final int? reviewer_id;
  final int? product_id;
  final int? rating;
  Review({
    this.id,
    this.reviewer_id,
    this.product_id,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  Review copyWith({
    int? id,
    int? reviewer_id,
    int? product_id,
    int? rating,
  }) {
    return Review(
      id: id ?? this.id,
      reviewer_id: reviewer_id ?? this.reviewer_id,
      product_id: product_id ?? this.product_id,
      rating: rating ?? this.rating,
    );
  }
}
