

// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  final String message;
  final Data data;
  final bool success;

  LoginData({
    required this.message,
    required this.data,
    required this.success,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "success": success,
  };
}

class Data {
  final String authToken;
  final User user;

  Data({
    required this.authToken,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    authToken: json["auth_token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "user": user.toJson(),
  };
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String roleId;
  final bool isVerified;
  final String accountId;
  final String organizationId;
  final String gender;
  final bool is2FaEnabled;
  final bool isDefaultPassword;
  final String status;
  final String loginId;
  final bool hasTransactionPin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime lastLogin;
  final String userId;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.roleId,
    required this.isVerified,
    required this.accountId,
    required this.organizationId,
    required this.gender,
    required this.is2FaEnabled,
    required this.isDefaultPassword,
    required this.status,
    required this.loginId,
    required this.hasTransactionPin,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastLogin,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    roleId: json["role_id"],
    isVerified: json["is_verified"],
    accountId: json["account_id"],
    organizationId: json["organization_id"],
    gender: json["gender"],
    is2FaEnabled: json["is_2FA_enabled"],
    isDefaultPassword: json["is_default_password"],
    status: json["status"],
    loginId: json["login_id"],
    hasTransactionPin: json["has_transaction_pin"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    lastLogin: DateTime.parse(json["last_login"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "role_id": roleId,
    "is_verified": isVerified,
    "account_id": accountId,
    "organization_id": organizationId,
    "gender": gender,
    "is_2FA_enabled": is2FaEnabled,
    "is_default_password": isDefaultPassword,
    "status": status,
    "login_id": loginId,
    "has_transaction_pin": hasTransactionPin,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "last_login": lastLogin.toIso8601String(),
    "user_id": userId,
  };
}
