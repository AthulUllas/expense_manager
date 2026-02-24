import 'package:expense_manager/features/auth/model/auth_response_model.dart';
import 'package:expense_manager/features/auth/model/create_account_response_model.dart';
import 'package:expense_manager/features/auth/service/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  Future<AuthResponseModel> sendOtp(String phone) {
    return authService.sendOtp(phone);
  }

  Future<CreateAccountResponseModel> createAccount({
    required String phone,
    required String nickname,
  }) {
    return authService.createAccount(phone: phone, nickname: nickname);
  }
}
