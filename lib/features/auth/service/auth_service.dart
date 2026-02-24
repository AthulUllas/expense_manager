import 'dart:convert';
import 'package:expense_manager/features/auth/model/auth_response_model.dart';
import 'package:expense_manager/features/auth/model/create_account_response_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "https://appskilltest.zybotech.in";

  Future<AuthResponseModel> sendOtp(String phone) async {
    final url = Uri.parse("$baseUrl/auth/send-otp");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone}),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        return AuthResponseModel.fromJson(decoded);
      } else {
        throw Exception("Failed to send OTP: ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }

  Future<CreateAccountResponseModel> createAccount({
    required String phone,
    required String nickname,
  }) async {
    final url = Uri.parse("$baseUrl/auth/create-account/");

    try {
      final response = await http
          .post(
            url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"phone": phone, "nickname": nickname}),
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        return CreateAccountResponseModel.fromJson(decoded);
      } else {
        throw Exception("Create Account Failed: ${response.body}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
