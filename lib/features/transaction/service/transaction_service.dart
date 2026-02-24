import 'dart:convert';
import 'package:expense_manager/features/transaction/model/add_transaction_response_model.dart';
import 'package:expense_manager/features/transaction/model/delete_transaction_response_model.dart';
import 'package:expense_manager/features/transaction/model/transaction_model.dart';
import 'package:expense_manager/features/transaction/model/transaction_response_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  static const String baseUrl = "https://appskilltest.zybotech.in";

  Future<TransactionResponseModel> getTransactions(String token) async {
    final url = Uri.parse("$baseUrl/transactions/");

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return TransactionResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch transactions: ${response.body}");
    }
  }

  Future<AddTransactionResponseModel> addTransactions({
    required String token,
    required List<TransactionModel> transactions,
  }) async {
    final url = Uri.parse("$baseUrl/transactions/add/");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "transactions": transactions.map((e) => e.toJson()).toList(),
      }),
    );

    if (response.statusCode == 200) {
      return AddTransactionResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to sync transactions: ${response.body}");
    }
  }

  Future<DeleteTransactionResponseModel> deleteTransactions({
    required String token,
    required List<String> ids,
  }) async {
    final url = Uri.parse("$baseUrl/transactions/delete/");

    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"ids": ids}),
    );

    if (response.statusCode == 200) {
      return DeleteTransactionResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to delete transactions: ${response.body}");
    }
  }
}
