import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_model.g.dart';

@JsonSerializable()
class NotificationsModel {

  final String? description;
  final bool? show;
  final String? title;

  NotificationsModel({
    this.description,
    this.show,
    this.title
  });

  factory NotificationsModel.fromRawJson(String str) => NotificationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);


}