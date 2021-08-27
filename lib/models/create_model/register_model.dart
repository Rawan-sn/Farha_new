import 'dart:convert';

class RegisterModel {
  String firstName;
  String lastName;
  String phone;
  String gender;
  String email;
  String password;
  String address;
  String type;

  RegisterModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.gender,
      this.email,
      this.password,
      this.address,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': gender,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      gender: map['gender'],
      email: map['email'],
      password: map['password'],
      address: map['address'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));
}
