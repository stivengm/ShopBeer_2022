import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'methos_pay_model.g.dart';

@JsonSerializable()
class MethodsPayModel {
  MethodsPayModel({
    this.description,
    this.img,
    this.name,
    this.typeMethodId,
    this.zona,
  });

  final String? description;
  final String? img;
  final String? name;
  final int? typeMethodId;
  final String? zona;

  factory MethodsPayModel.fromRawJson(String str) => MethodsPayModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MethodsPayModel.fromJson(Map<String, dynamic> json) => _$MethodsPayModelFromJson(json);

  Map<String, dynamic> toJson() => _$MethodsPayModelToJson(this);

}
