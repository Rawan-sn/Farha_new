import 'dart:convert';

class UserModel {
  int id;
  String firstName;
  String lastName;
  String phone;
  String gender;
  String address;
  int isBlocked;
  String type;
  String email;
  dynamic emailVerifiedName;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.address,
    this.isBlocked,
    this.type,
    this.email,
    this.emailVerifiedName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': gender,
      'address': address,
      'is_blocked': isBlocked,
      'type': type,
      'email': email,
      'email_verified_at': emailVerifiedName,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      gender: map['gender'],
      address: map['address'],
      isBlocked: map['is_blocked'],
      type: map['type'],
      email: map['email'],
      emailVerifiedName: map['email_verified_at'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
