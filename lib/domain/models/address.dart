import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address {
  final int? id;
  final int? user_id;
  final String? street;
  final String? city;
  final String? apartment;
  final int? zipcode;
  final String? country;

  Address({
    this.id,
    this.user_id,
    this.street,
    this.city,
    this.apartment,
    this.zipcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith({
    int? id,
    int? user_id,
    String? street,
    String? city,
    String? apartment,
    int? zipcode,
    String? country,
  }) {
    return Address(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      street: street ?? this.street,
      city: city ?? this.city,
      apartment: apartment ?? this.apartment,
      zipcode: zipcode ?? this.zipcode,
      country: country ?? this.country,
    );
  }
}
