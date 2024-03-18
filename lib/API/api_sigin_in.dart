import 'dart:convert';

import 'package:http/http.dart' as http;

import '../features/Home Scree/models/account_lookup.dart';
import '../features/authentication/models/user_data.dart';

class API {

  final String apiUrl = 'https://staging-api-gateway.primussuite.com';
  String? accessToken;
  late LoginData loginData;

  Future<bool> signin(String loginId, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/v1/users/pre-login'),
      body: {
        'loginId': loginId,
        'password': password
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      loginData = LoginData(
        message: responseData['message'] ?? '',
        data: Data.fromJson(responseData['data'] ?? {}),
        success: responseData['success'] ?? false,
      );

      accessToken = loginData.data.authToken;
      return loginData.success;
    } else {
      throw Exception(
          'Failed to sign in: ${response.statusCode} ${response.body}');
    }
  }

  Future<http.Response> fetchData(String endpoint) async {
    if (accessToken != null) {
      final response = await http.get(
        Uri.parse('$apiUrl/$endpoint'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      // Handle user not authenticated (no access token available)
      throw Exception('User not authenticated');
    }
  }

  Future<AccountLookup> accountLookup(String accountNumber,
      String? bankCode) async {
      try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl/api/v1/transaction/account_lookup?account_number=$accountNumber&bank_code=$bankCode'),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return AccountLookup.fromJson(responseData);
      } else {
        print('Failed to perform account lookup. Status Code: ${response
            .statusCode}');
        print('Response Body: ${response.body}');
        throw Exception(
            'Failed to perform account lookup. Status Code: ${response
                .statusCode}');
      }
    } catch (e) {
      throw Exception('Error during account lookup: $e');
    }

  }

// static Future<String?> signin(String loginId, String password) async {
//   String apiUrl =
//       'https://staging-api-gateway.primussuite.com/api/v1/users/pre-login';
//
//   try {
//     // Make POST request
//     var response = await http.post(
//       Uri.parse(apiUrl),
//       body: {
//         'loginId': loginId,
//         'password': password,
//       },
//     );
//
//     // Check status code
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       // Handle other status codes (e.g., show error message)
//       print('Error: ${response.reasonPhrase}');
//       return null;
//     }
//   } catch (e) {
//     // Handle exceptions
//     print('Error: $e');
//     return null;
//   }
// }

}