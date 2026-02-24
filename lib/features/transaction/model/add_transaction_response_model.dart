class AddTransactionResponseModel {
  final String status;
  final List<String> syncedIds;

  AddTransactionResponseModel({required this.status, required this.syncedIds});

  factory AddTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return AddTransactionResponseModel(
      status: json['status'],
      syncedIds: List<String>.from(json['synced_ids']),
    );
  }
}
