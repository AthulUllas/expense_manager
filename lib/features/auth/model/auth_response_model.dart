class AuthResponseModel {
  final String status;
  final String otp;
  final bool userExists;
  final String? nickname;
  final String token;

  AuthResponseModel({
    required this.status,
    required this.otp,
    required this.userExists,
    required this.nickname,
    required this.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      otp: json['otp'],
      userExists: json['user_exists'],
      nickname: json['nickname'],
      token: json['token'],
    );
  }
}
