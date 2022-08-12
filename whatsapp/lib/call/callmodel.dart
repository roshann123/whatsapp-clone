import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CallModel welcomeFromJson(String str) => CallModel.fromJson(json.decode(str));

String welcomeToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
    CallModel({
        this.avatar,
        this.name,
        this.calledAt,
        this.isGroup 
    });

    String? avatar;
    String? name;
    String? calledAt;
    bool? isGroup;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        avatar: json["avatar"],
        name: json["name"],
        calledAt: json["called at"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "called at": calledAt,
    };
}
