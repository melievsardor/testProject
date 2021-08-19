// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
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

  factory Search.fromJson(Map<String, dynamic> json) => Search(
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
    required this.unitCode,
    required this.unitName,
    required this.commonUnitCode,
    required this.commonUnitName,
    required this.units,
    required this.myProduct,
  });

  String mxikCode;
  String groupName;
  String className;
  String positionName;
  String subPositionName;
  dynamic brandName;
  dynamic attributeName;
  int unitCode;
  String unitName;
  int commonUnitCode;
  String commonUnitName;
  List<Unit> units;
  int myProduct;

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
        commonUnitCode:
            json["commonUnitCode"] == null ? null : json["commonUnitCode"],
        commonUnitName:
            json["commonUnitName"] == null ? null : json["commonUnitName"],
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
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
        "commonUnitCode": commonUnitCode == null ? null : commonUnitCode,
        "commonUnitName": commonUnitName == null ? null : commonUnitName,
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
        "myProduct": myProduct,
      };
}

class Unit {
  Unit({
    required this.id,
    required this.name,
    required this.nameUz,
    required this.nameRu,
    this.nameEng,
    this.nameLatin,
    required this.unit,
    required this.commonUnitsId,
    required this.difference,
    required this.description,
  });

  int id;
  String name;
  String nameUz;
  String nameRu;
  dynamic nameEng;
  dynamic nameLatin;
  String unit;
  int commonUnitsId;
  String difference;
  String description;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        name: json["name"],
        nameUz: json["nameUz"],
        nameRu: json["nameRu"],
        nameEng: json["nameEng"],
        nameLatin: json["nameLatin"],
        unit: json["unit"],
        commonUnitsId: json["commonUnitsId"],
        difference: json["difference"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameUz": nameUz,
        "nameRu": nameRu,
        "nameEng": nameEng,
        "nameLatin": nameLatin,
        "unit": unit,
        "commonUnitsId": commonUnitsId,
        "difference": difference,
        "description": description,
      };
}
