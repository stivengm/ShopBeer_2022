import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  ProductsModel({
    this.id,
    this.description,
    this.img,
    this.name,
    this.price,
    this.typeProductId,
    this.cantidad
  });

  final int? id;
  final String? description;
  final String? img;
  final String? name;
  final String? price;
  final int? typeProductId;
  final int? cantidad;

  ProductsModel copyWith({
    int? id,
    String? description,
    String? img,
    String? name,
    String? price,
    int? typeProductId,
    int? cantidad,
  }) => ProductsModel(
    id: id ?? this.id,
    description: description ?? this.description,
    img: img ?? this.img,
    name: name ?? this.name,
    price: price ?? this.price,
    typeProductId: typeProductId ?? this.typeProductId,
    cantidad: cantidad ?? this.cantidad
  );

  factory ProductsModel.fromRawJson(String str) => ProductsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

}
