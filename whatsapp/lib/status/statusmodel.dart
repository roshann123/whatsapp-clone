// To parse this JSON data, do
//
//     final StatusModel = StatusModelFromJson(jsonString);

import 'dart:convert';

StatusModel StatusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String StatusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
    StatusModel({
        this.avatar,
        this.name,
        this.updatedAt,
    });

    String? avatar;
    String? name;
    String? updatedAt;

    factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        avatar: json["avatar"],
        name: json["name"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "updatedAt": updatedAt,
    };
}

