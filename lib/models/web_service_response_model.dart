import 'dart:convert';

class WebServiceResponse {
  int status;
  dynamic data;
  String message;
  String token;

  WebServiceResponse({
    this.status,
    this.data,
    this.message,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data,
      'message': message,
      'token': token,
    };
  }

  factory WebServiceResponse.fromMap(Map<String, dynamic> map) {
    return WebServiceResponse(
      status: map['status'],
      data: map['data'],
      message: map['message'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WebServiceResponse.fromJson(String source) =>
      WebServiceResponse.fromMap(json.decode(source));
}
