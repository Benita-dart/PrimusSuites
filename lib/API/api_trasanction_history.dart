import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:primus_suites/features/Home%20Scree/models/transaction_history.model.dart';

List transactionDetails = [];

Future<TransactionHistoryModal> fetchTransactionHistory() async {
  final response = await http.get(Uri.parse(
      'https://staging-api-gateway.primussuite.com/api/v1/transaction/fund_transfer_history/00510011011003213?fromDate=2024-01-01&toDate=2024-03-1'));

  if (response.statusCode == 200) {
    print(response.body);
    dynamic responseData = TransactionHistoryModal.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(responseData['amount']);
    return responseData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
