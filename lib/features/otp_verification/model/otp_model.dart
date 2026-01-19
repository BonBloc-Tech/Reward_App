class OtpVerifyResponse {
  final String status;
  final bool isCustomer;
  final bool isAdmin;
  final String token;
  final String message;

  OtpVerifyResponse({
    required this.status,
    required this.isCustomer,
    required this.token,
    required this.isAdmin,
    required this.message,
  });

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifyResponse(
      status: json['status'] ?? '',
      isCustomer: json['iscustomer'] ?? false,
      token: json['token']??'',
      isAdmin: json['isadmin'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
class OtpVerifyRequest {
  final String email;
  final String otp;
  final String password;

  OtpVerifyRequest({
    required this.email,
    this.otp = '',
    this.password = '',
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "password": password,
      };
}

