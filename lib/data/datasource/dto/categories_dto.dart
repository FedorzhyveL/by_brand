import 'package:json_annotation/json_annotation.dart';

part 'categories_dto.g.dart';

@JsonSerializable()
class CategorieData {
  final int? id;
  final String? name;
  final String? description;

  CategorieData({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CategorieData.fromJson(Map<String, dynamic> json) => _$CategorieDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategorieDataToJson(this);
}
