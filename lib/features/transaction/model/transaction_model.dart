class TransactionModel {
  final String id;
  final double amount;
  final String note;
  final String type;
  final String categoryId;
  final DateTime timestamp;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.note,
    required this.type,
    required this.categoryId,
    required this.timestamp,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      amount: (json['amount'] as num).toDouble(),
      note: json['note'],
      type: json['type'],
      categoryId: json['category_id'] ?? json['category'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "amount": amount,
      "note": note,
      "type": type,
      "category_id": categoryId,
      "timestamp": timestamp
          .toIso8601String()
          .replaceFirst('T', ' ')
          .split('.')
          .first,
    };
  }
}
