class AddCategoryResponseModel {
  final String status;
  final List<String> syncedIds;

  AddCategoryResponseModel({required this.status, required this.syncedIds});

  factory AddCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return AddCategoryResponseModel(
      status: json['status'],
      syncedIds: List<String>.from(json['synced_ids']),
    );
  }
}
