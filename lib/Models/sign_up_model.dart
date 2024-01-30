// To parse this JSON data, do
//
//     final signUpDataModel = signUpDataModelFromJson(jsonString);

import 'dart:convert';

SignUpDataModel signUpDataModelFromJson(String str) => SignUpDataModel.fromJson(json.decode(str));

String signUpDataModelToJson(SignUpDataModel data) => json.encode(data.toJson());

class SignUpDataModel {
    final String? statusCode;
    final String? status;
    final String? message;

    SignUpDataModel({
        this.statusCode,
        this.status,
        this.message,
    });

    factory SignUpDataModel.fromJson(Map<String, dynamic> json) => SignUpDataModel(
        statusCode: json["status_code"] ?? 200,
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode ?? 200,
        "status": status,
        "message": message,
    };
}
