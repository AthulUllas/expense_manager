import 'package:expense_manager/features/transaction/model/add_transaction_response_model.dart';
import 'package:expense_manager/features/transaction/model/delete_transaction_response_model.dart';
import 'package:expense_manager/features/transaction/model/transaction_model.dart';
import 'package:expense_manager/features/transaction/model/transaction_response_model.dart';
import 'package:expense_manager/features/transaction/service/transaction_service.dart';

class TransactionRepository {
  final TransactionService service;

  TransactionRepository(this.service);

  Future<TransactionResponseModel> getTransactions(String token) {
    return service.getTransactions(token);
  }

  Future<AddTransactionResponseModel> addTransactions({
    required String token,
    required List<TransactionModel> transactions,
  }) {
    return service.addTransactions(token: token, transactions: transactions);
  }

  Future<DeleteTransactionResponseModel> deleteTransactions({
    required String token,
    required List<String> ids,
  }) {
    return service.deleteTransactions(token: token, ids: ids);
  }
}
