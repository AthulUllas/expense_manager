import 'package:expense_manager/features/category/model/add_category_response_model.dart';
import 'package:expense_manager/features/category/model/category_model.dart';
import 'package:expense_manager/features/category/model/category_response_model.dart';
import 'package:expense_manager/features/category/model/delete_category_response_model.dart';
import 'package:expense_manager/features/category/service/category_service.dart';

class CategoryRepository {
  final CategoryService service;

  CategoryRepository(this.service);

  Future<CategoryResponseModel> getCategories(String token) {
    return service.getCategories(token);
  }

  Future<AddCategoryResponseModel> addCategories({
    required String token,
    required List<CategoryModel> categories,
  }) {
    return service.addCategories(token: token, categories: categories);
  }

  Future<DeleteCategoryResponseModel> deleteCategories({
    required String token,
    required List<String> ids,
  }) {
    return service.deleteCategories(token: token, ids: ids);
  }
}
