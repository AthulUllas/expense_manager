import 'dart:convert';
import 'package:expense_manager/features/category/model/add_category_response_model.dart';
import 'package:expense_manager/features/category/model/category_model.dart';
import 'package:expense_manager/features/category/model/category_response_model.dart';
import 'package:expense_manager/features/category/model/delete_category_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static const String baseUrl = "https://appskilltest.zybotech.in";

  Future<CategoryResponseModel> getCategories(String token) async {
    final url = Uri.parse("$baseUrl/categories/");

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return CategoryResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch categories: ${response.body}");
    }
  }

  Future<AddCategoryResponseModel> addCategories({
    required String token,
    required List<CategoryModel> categories,
  }) async {
    final url = Uri.parse("$baseUrl/categories/add/");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "categories": categories.map((e) => e.toJson()).toList(),
      }),
    );

    if (response.statusCode == 200) {
      return AddCategoryResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add categories: ${response.body}");
    }
  }

  Future<DeleteCategoryResponseModel> deleteCategories({
    required String token,
    required List<String> ids,
  }) async {
    final url = Uri.parse("$baseUrl/categories/delete/");

    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"ids": ids}),
    );

    if (response.statusCode == 200) {
      return DeleteCategoryResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Delete Failed: ${response.body}");
    }
  }
}
