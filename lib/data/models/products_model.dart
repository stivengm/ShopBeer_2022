import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  ProductsModel({
    this.description,
    this.img,
    this.name,
    this.price,
    this.typeProductId,
  });

  final String? description;
  final String? img;
  final String? name;
  final String? price;
  final int? typeProductId;

  factory ProductsModel.fromRawJson(String str) => ProductsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

}
