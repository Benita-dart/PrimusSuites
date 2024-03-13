// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class API {
//   static Future<String?> getUserProfile(String token) async {
//     String apiUrl = 'https://staging-api-gateway.primussuite.com/api/v1/users/profile';
//
//     try {
//       var response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         return data['data']['first_name'];
//       } else {
//         print('Error: ${response.reasonPhrase}');
//         return null;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }
// }
