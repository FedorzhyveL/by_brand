import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  final int? id;
  final int? user_id;
  final String? status;
  Order({
    this.id,
    this.user_id,
    this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order copyWith({
    int? id,
    int? user_id,
    String? status,
  }) {
    return Order(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      status: status ?? this.status,
    );
  }
}
