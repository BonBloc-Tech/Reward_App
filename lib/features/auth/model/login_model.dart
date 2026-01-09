class LoginModel {
  final String status;
  final bool? isCustomer;
  final bool? isAdmin;
  final String message;

  LoginModel({
    required this.status,
     this.isCustomer,
     this.isAdmin,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? '',
      isCustomer: json['iscustomer'] ?? false,
      isAdmin: json['isadmin'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
