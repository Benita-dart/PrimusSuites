// To parse this JSON data, do
//
//     final accountLookup = accountLookupFromJson(jsonString);

import 'dart:convert';

AccountLookup accountLookupFromJson(String str) => AccountLookup.fromJson(json.decode(str));

String accountLookupToJson(AccountLookup data) => json.encode(data.toJson());

class AccountLookup {
  final String message;
  final AccountData data;
  final bool success;

  AccountLookup({
    required this.message,
    required this.data,
    required this.success,
  });

  factory AccountLookup.fromJson(Map<String, dynamic> json) => AccountLookup(
    message: json["message"],
    data: AccountData.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "success": success,
  };
}

class AccountData {
  final String name;
  final dynamic bvn;
  final dynamic kyc;
  final bool isSuccessful;
  final bool sessionId;
  final String responseMessage;
  final String defaultGateWay;
  final dynamic institutionCode;

  AccountData({
    required this.name,
    required this.bvn,
    required this.kyc,
    required this.isSuccessful,
    required this.sessionId,
    required this.responseMessage,
    required this.defaultGateWay,
    required this.institutionCode,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
    name: json["name"],
    bvn: json["bvn"],
    kyc: json["kyc"],
    isSuccessful: json["is_successful"],
    sessionId: json["session_id"],
    responseMessage: json["response_message"],
    defaultGateWay: json["default_gateWay"],
    institutionCode: json["institution_code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "bvn": bvn,
    "kyc": kyc,
    "is_successful": isSuccessful,
    "session_id": sessionId,
    "response_message": responseMessage,
    "default_gateWay": defaultGateWay,
    "institution_code": institutionCode,
  };
}
