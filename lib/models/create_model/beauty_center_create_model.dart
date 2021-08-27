import 'dart:convert';

import '../beauty_section_model.dart';

class CreateBeautyCenterModel {
  String name;
  String address;
  String facebook;
  String description;
  String logo;
  String phone;
  List<String> images;
  String startTime;
  String endTime;
  String type;
  List<BeautySectionModel> details;
  CreateBeautyCenterModel({
    this.name,
    this.address,
    this.facebook,
    this.description,
    this.logo,
    this.phone,
    this.startTime,
    this.endTime,
    this.type,
    this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'facebook': facebook,
      'description': description,
      'logo': logo,
      'phone': phone,
      'start_time': startTime,
      'end_time': endTime,
      'type': type,
      'details': details?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CreateBeautyCenterModel.fromMap(Map<String, dynamic> map) {
    return CreateBeautyCenterModel(
      name: map['name'],
      address: map['address'],
      facebook: map['facebook'],
      description: map['description'],
      logo: map['logo'],
      phone: map['phone'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      type: map['type'],
      details: List<BeautySectionModel>.from(
          map['details']?.map((x) => BeautySectionModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateBeautyCenterModel.fromJson(String source) =>
      CreateBeautyCenterModel.fromMap(json.decode(source));
}
