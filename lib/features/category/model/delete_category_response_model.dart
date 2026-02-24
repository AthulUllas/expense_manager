class DeleteCategoryResponseModel {
  final String status;
  final List<String> deletedIds;

  DeleteCategoryResponseModel({required this.status, required this.deletedIds});

  factory DeleteCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteCategoryResponseModel(
      status: json['status'],
      deletedIds: List<String>.from(json['deleted_ids']),
    );
  }
}
