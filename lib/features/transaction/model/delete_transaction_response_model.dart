class DeleteTransactionResponseModel {
  final String status;
  final List<String> deletedIds;

  DeleteTransactionResponseModel({
    required this.status,
    required this.deletedIds,
  });

  factory DeleteTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteTransactionResponseModel(
      status: json['status'],
      deletedIds: List<String>.from(json['deleted_ids']),
    );
  }
}
