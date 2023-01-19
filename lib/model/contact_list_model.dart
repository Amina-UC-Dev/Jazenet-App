// To parse this JSON data, do
//
//     final contactList = contactListFromJson(jsonString);

import 'dart:convert';

ContactList contactListFromJson(String str) => ContactList.fromJson(json.decode(str));

String contactListToJson(ContactList data) => json.encode(data.toJson());

class ContactList {
  ContactList({
    required this.success,
    required this.result,
    required this.successMessage,
    required this.errorMessage,
  });

  String success;
  Result result;
  String successMessage;
  String errorMessage;

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
    success: json["success"],
    result: Result.fromJson(json["result"]),
    successMessage: json["successMessage"],
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result.toJson(),
    "successMessage": successMessage,
    "errorMessage": errorMessage,
  };
}

class Result {
  Result({
    required this.jazenetContactList,
  });

  JazenetContactList jazenetContactList;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    jazenetContactList: JazenetContactList.fromJson(json["jazenet_contact_list"]),
  );

  Map<String, dynamic> toJson() => {
    "jazenet_contact_list": jazenetContactList.toJson(),
  };
}

class JazenetContactList {
  JazenetContactList({
    required this.compResults,
  });

  List<CompResult> compResults;

  factory JazenetContactList.fromJson(Map<String, dynamic> json) => JazenetContactList(
    compResults: List<CompResult>.from(json["comp_results"].map((x) => CompResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "comp_results": List<dynamic>.from(compResults.map((x) => x.toJson())),
  };
}

class CompResult {
  CompResult({
    required this.accountId,
    required this.accountType,
    required this.name,
    required this.logo,
    required this.category,
    required this.categoryName,
    required this.location,
  });

  String accountId;
  String accountType;
  String name;
  String logo;
  String category;
  String categoryName;
  String location;

  factory CompResult.fromJson(Map<String, dynamic> json) => CompResult(
    accountId: json["account_id"],
    accountType: json["account_type"],
    name: json["name"],
    logo: json["logo"],
    category: json["category"],
    categoryName: json["category_name"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "account_id": accountId,
    "account_type": accountType,
    "name": name,
    "logo": logo,
    "category": category,
    "category_name": categoryName,
    "location": location,
  };
}
