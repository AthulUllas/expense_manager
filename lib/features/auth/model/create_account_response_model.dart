class CreateAccountResponseModel {
  final String status;
  final String token;

  CreateAccountResponseModel({required this.status, required this.token});

  factory CreateAccountResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountResponseModel(
      status: json['status'],
      token: json['token'],
    );
  }
}
