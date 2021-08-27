import 'dart:convert';

import 'ServiceHallDetails.dart';
import 'image_model.dart';

class HallServiceModel {
//
  int id;
  int childId;
  int ownerId;
  String address;
  String logo;
  int rate;
  String name;
  String facebook;
  String phone;
  String description;
  String status;
  String type;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  List<ImageModel> images;
  String serviceType;
  ServiceHallDetails serviceHallDetails;
  HallServiceModel({
     this.id,
     this.childId,
     this.ownerId,
     this.address,
     this.logo,
     this.rate,
     this.name,
     this.facebook,
     this.phone,
     this.description,
     this.status,
     this.type,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
     this.images,
     this.serviceType,
     this.serviceHallDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'child_id': childId,
      'owner_id': ownerId,
      'address': address,
      'logo': logo,
      'rate': rate,
      'name': name,
      'facebook': facebook,
      'phone': phone,
      'description': description,
      'status': status,
      'type': type,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'images': images?.map((x) => x.toMap())?.toList(),
      'service_type': serviceType,
      'service_details': serviceHallDetails.toMap(),
    };
  }

  factory HallServiceModel.fromMap(Map<String, dynamic> map) {
    return HallServiceModel(
      id: map['id'],
      childId: map['child_id'],
      ownerId: map['owner_id'],
      address: map['address'],
      logo: map['logo'],
      rate: map['rate'],
      name: map['name'],
      facebook: map['facebook'],
      phone: map['phone'],
      description: map['description'],
      status: map['status'],
      type: map['type'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_ at'],
      images: List<ImageModel>.from(map['images']?.map((x) => ImageModel.fromMap(x))),
      serviceType: map['service_type'],
      serviceHallDetails: ServiceHallDetails.fromMap(map['service_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HallServiceModel.fromJson(String source) => HallServiceModel.fromMap(json.decode(source));
}
