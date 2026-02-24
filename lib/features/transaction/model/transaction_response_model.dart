import 'transaction_model.dart';

class TransactionResponseModel {
  final String status;
  final List<TransactionModel> transactions;

  TransactionResponseModel({required this.status, required this.transactions});

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return TransactionResponseModel(
      status: json['status'],
      transactions: (json['transactions'] as List)
          .map((e) => TransactionModel.fromJson(e))
          .toList(),
    );
  }
}
