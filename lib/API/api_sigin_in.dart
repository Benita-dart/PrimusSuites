import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:primus_suites/features/Home%20Scree/models/balance.dart';
import 'package:primus_suites/features/Home%20Scree/models/transaction_history.model.dart';
import 'package:primus_suites/features/authentication/token_manager/token_saver.dart';

import '../features/Home Scree/models/account_lookup.dart';
import '../features/authentication/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  final String apiUrl = 'https://staging-api-gateway.primussuite.com';
  late String accessToken;
  late LoginData loginData;

  Future<bool> signin(String loginId, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/v1/users/pre-login'),
      body: {'loginId': loginId, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      loginData = LoginData(
        message: responseData['message'] ?? '',
        data: Data.fromJson(responseData['data'] ?? {}),
        success: responseData['success'] ?? false,
      );

      accessToken = loginData.data.authToken;
      print('before $accessToken');
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('authToken', responseData['data']['auth_token']);
      // dynamic token = prefs.getString(
      //   'authToken',
      // );
      TokenManager.saveToken(accessToken);

      // print(
      //     'getString token $token'); //to set authToken from the response and saving it
      // print('now $accessToken');

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

  Future<AccountLookup> accountLookup(
      String accountNumber, String? bankCode) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$apiUrl/api/v1/transaction/account_lookup?account_number=$accountNumber&bank_code=$bankCode'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return AccountLookup.fromJson(responseData);
      } else {
        throw Exception('Failed to perform account lookup');
      }
    } catch (e) {
      throw Exception('Error during account lookup: $e');
    }
  }

  Future<BalanceData> fetchBalance() async {
    final accessToken = await TokenManager.getToken();
    print('now $accessToken');
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/api/v1/accounts/balance'),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final responseData = json.decode(response.body);

        return BalanceData.fromJson(responseData["data"]); // _balanceData;
      } else {
        print('Error: ${response.reasonPhrase}');
        throw Exception('Failed to load balance');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      throw Exception('Failed to load  balance $e');
    }
  }

  Future<List<Message>?> fetchTransactionData() async {
    List<Message> messagesList = [];
    final accessToken = await TokenManager.getToken();
    print('transaction token nowin $accessToken');
    final response = await http.get(
      Uri.parse(
          '$apiUrl/api/v1/transaction/fund_transfer_history/00510011011003213?fromDate=2024-01-01&toDate=2024-03-13'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    print('DATA FROM THE BACKEND; $response');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final transactionHistoryModal =
          TransactionHistoryModal.fromJson(jsonData);

      // Accessing transaction date and amount
      if (transactionHistoryModal.success == true) {
        final List<Message>? messages = transactionHistoryModal.data?.message;
        messagesList = messages ?? [];
        print('messages $messages');
      }
    } else {
      // Handle error
      print('Failed to fetch transaction data');
    }
    return messagesList;
  }
}

  // Future<Message> fetchTransactionHistory() async {
  //   final accessToken = await TokenManager.getToken();
  //   print('transaction token nowin $accessToken');
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           '$apiUrl/api/v1/transaction/fund_transfer_history/00510011011003213?fromDate=2024-01-01&toDate=2024-03-13'),
  //       headers: {'Authorization': 'Bearer $accessToken'},
  //     );

  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       dynamic responseData = jsonDecode(response.body);
  //       for (var transaction in responseData['data']) {
  //         print('transaction item: $transaction');
  //       }
  //       print(responseData['amount']);
  //       return Message.fromJson(responseData['data']);
  //     } else {
  //       // If the server did not return a 200 OK response,
  //       // then throw an exception.
  //       throw Exception('Failed to load trancaction history');
  //     }
  //   } catch (e) {
  //     // Handle exceptions
  //     print('Error: $e');
  //     throw Exception('Failed to load  history ');
  //   }
  // }

