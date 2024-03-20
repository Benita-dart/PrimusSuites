// import 'dart:async';

// import 'package:http/http.dart' as http;

// class Balance {
//   static Future<String> fetchBalance() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://staging-api-gateway.primussuite.com/api/v1/users/'));

//       if (response.statusCode == 200) {
//         // If the server did return a 200 OK response,
//         // then parse the JSON.
//         return response.body;
//       } else {
//         print('Error: ${response.reasonPhrase}');
//         throw Exception('Failed to load balance');
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('Error: $e');
//       throw Exception('Failed to load  balance');
//     }
//   }
// }
