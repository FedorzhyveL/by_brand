import 'package:json_annotation/json_annotation.dart';

part 'base_dto.g.dart';

@JsonSerializable()
class BaseDTO {
  final Map<String, dynamic>? data;
  final String? message;
  final int? status;
  final String? timestamp;

  BaseDTO({
    required this.data,
    required this.message,
    required this.status,
    required this.timestamp,
  });

  factory BaseDTO.fromJson(Map<String, dynamic> json) => _$BaseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDTOToJson(this);
}

@JsonSerializable()
class BaseDTOList {
  final BaseDTOListData data;
  final String? message;
  final int? status;
  final String? timestamp;

  BaseDTOList({
    required this.data,
    required this.message,
    required this.status,
    required this.timestamp,
  });

  factory BaseDTOList.fromJson(Map<String, dynamic> json) => _$BaseDTOListFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDTOListToJson(this);
}

@JsonSerializable()
class BaseDTOListData {
  final List<Map<String, dynamic>?>? content;
  final PageableData? pageableData;
  final int? totalPages;
  final int? totalElements;
  final bool? last;
  final int? size;
  final int? number;
  final List<String>? sort;
  final int? numberOfElements;
  final bool? first;
  final bool? empty;

  BaseDTOListData({
    required this.content,
    required this.pageableData,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  factory BaseDTOListData.fromJson(Map<String, dynamic> json) => _$BaseDTOListDataFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDTOListDataToJson(this);
}

@JsonSerializable()
class PageableData {
  final int? pageNumber;
  final int? pageSize;
  final List<String>? sort;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  PageableData({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory PageableData.fromJson(Map<String, dynamic> json) => _$PageableDataFromJson(json);

  Map<String, dynamic> toJson() => _$PageableDataToJson(this);
}
