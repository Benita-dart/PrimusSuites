import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final double amount;
  final String type; // This could be 'sent' or 'received' for example
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['transaction_id'],
      amount: json['amount'],
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': id,
      'amount': amount,
      'type': type,
      'date': date.toIso8601String(),
    };
  }
}
