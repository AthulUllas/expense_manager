import 'category_model.dart';

class CategoryResponseModel {
  final String status;
  final List<CategoryModel> categories;

  CategoryResponseModel({required this.status, required this.categories});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      status: json['status'],
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}
