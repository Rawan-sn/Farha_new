import 'dart:convert';

class UpdateProfileModel {
  String firstName;
  String lastName;
  String gender;
  String phone;
  String address;

  UpdateProfileModel(
      {this.firstName, this.lastName, this.gender, this.phone, this.address});

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': gender,
      'address': address,
    };
  }

  factory UpdateProfileModel.fromMap(Map<String, dynamic> map) {
    return UpdateProfileModel(
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      gender: map['gender'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileModel.fromJson(String source) =>
      UpdateProfileModel.fromMap(json.decode(source));
}
