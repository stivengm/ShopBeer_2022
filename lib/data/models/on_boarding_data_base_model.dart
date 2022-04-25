import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'on_boarding_data_base_model.g.dart';

@JsonSerializable()
class OnBoardingDataBaseModel {
  
  OnBoardingDataBaseModel({
    this.id,
    this.show,
    this.description
  });

  int? id;
  String? show;
  String? description;

  OnBoardingDataBaseModel copyWith({
    int? id,
    String? show,
    String? description,
  }) => OnBoardingDataBaseModel(
    id: id ?? this.id,
    show: show ?? this.show,
    description: description ?? this.description
  );

  factory OnBoardingDataBaseModel.fromRawJson(String str) => OnBoardingDataBaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnBoardingDataBaseModel.fromJson(Map<String, dynamic> json) => _$OnBoardingDataBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnBoardingDataBaseModelToJson(this);

}