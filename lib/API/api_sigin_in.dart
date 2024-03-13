import 'package:http/http.dart' as http;

class API {
  static Future<String?> signin(String loginId, String password) async {
    String apiUrl =
        'https://staging-api-gateway.primussuite.com/api/v1/users/pre-login';

    try {
      // Make POST request
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'loginId': loginId,
          'password': password,
        },
      );

      // Check status code
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // Handle other status codes (e.g., show error message)
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      return null;
    }
  }
}
