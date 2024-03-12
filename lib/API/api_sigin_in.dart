import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primus_suites/common/widgets/colors.dart';
import 'package:primus_suites/features/Home%20Scree/views/dashboard.dart';
import 'package:primus_suites/features/authentication/views/signup.dart';

class API {
  static void signin(String username, String password) async {
    String apiUrl =
        'https://staging-api-gateway.primussuite.com/api/v1/users/pre-login';

    try {
      // Make POST request
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      // Check status code
      if (response.statusCode == 200) {
      } else {
        // Handle other status codes (e.g., show error message)
        // You might want to decode the response body for more specific error handling
        debugPrint('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle exceptions
      debugPrint('Error: $e');
    }
  }
}
