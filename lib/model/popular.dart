// To parse this JSON data, do
//
//     final popular = popularFromJson(jsonString);

import 'dart:convert';

Popular popularFromJson(String str) => Popular.fromJson(json.decode(str));

String popularToJson(Popular data) => json.encode(data.toJson());

class Popular {
  Popular({
    required this.success,
    required this.code,
    required this.reason,
    this.data,
    this.errors,
  });

  bool success;
  int code;
  String reason;
  List<Datum>? data;
  dynamic errors;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        success: json["success"],
        code: json["code"],
        reason: json["reason"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "reason": reason,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "errors": errors,
      };
}

class Datum {
  Datum({
    required this.mxikCode,
    required this.groupName,
    required this.className,
    required this.positionName,
    required this.subPositionName,
    this.brandName,
    this.attributeName,
    this.unitCode,
    required this.unitName,
    this.commonUnitCode,
    this.commonUnitName,
    this.units,
    this.myProduct,
  });

  String mxikCode;
  String groupName;
  String className;
  String positionName;
  String subPositionName;
  dynamic brandName;
  dynamic attributeName;
  int? unitCode;
  String unitName;
  dynamic commonUnitCode;
  dynamic commonUnitName;
  dynamic units;
  int? myProduct;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        mxikCode: json["mxikCode"],
        groupName: json["groupName"],
        className: json["className"],
        positionName: json["positionName"],
        subPositionName: json["subPositionName"],
        brandName: json["brandName"],
        attributeName: json["attributeName"],
        unitCode: json["unitCode"] == null ? null : json["unitCode"],
        unitName: json["unitName"],
        commonUnitCode: json["commonUnitCode"],
        commonUnitName: json["commonUnitName"],
        units: json["units"],
        myProduct: json["myProduct"],
      );

  Map<String, dynamic> toJson() => {
        "mxikCode": mxikCode,
        "groupName": groupName,
        "className": className,
        "positionName": positionName,
        "subPositionName": subPositionName,
        "brandName": brandName,
        "attributeName": attributeName,
        "unitCode": unitCode == null ? null : unitCode,
        "unitName": unitName,
        "commonUnitCode": commonUnitCode,
        "commonUnitName": commonUnitName,
        "units": units,
        "myProduct": myProduct,
      };
}
