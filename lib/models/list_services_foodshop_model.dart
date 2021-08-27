import 'dart:convert';

import 'package:farha_app/models/service_foodshop_details.dart';

import 'image_model.dart';

class ListServiceFoodShopModel {
  int id;
  int childId;
  int ownerId;
  String address;
  int rate;
  String logo;
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
  ServiceFoodShopDetails serviceFoodShopDetails;
  ListServiceFoodShopModel({
     this.id,
     this.childId,
     this.ownerId,
     this.address,
     this.rate,
     this.logo,
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
     this.serviceFoodShopDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'child_id': childId,
      'owner_id': ownerId,
      'address': address,
      'rate': rate,
      'logo': logo,
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
      'service_details': serviceFoodShopDetails.toMap(),
    };
  }

  factory ListServiceFoodShopModel.fromMap(Map<String, dynamic> map) {
    return ListServiceFoodShopModel(
      id: map['id'],
      childId: map['child_id'],
      ownerId: map['owner_id'],
      address: map['address'],
      rate: map['rate'],
      logo: map['logo'],
      name: map['name'],
      facebook: map['facebook'],
      phone: map['phone'],
      description: map['description'],
      status: map['status'],
      type: map['type'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      images: List<ImageModel>.from(map['images']?.map((x) => ImageModel.fromMap(x))),
      serviceType: map['service_type'],
      serviceFoodShopDetails: ServiceFoodShopDetails.fromMap(map['service_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListServiceFoodShopModel.fromJson(String source) => ListServiceFoodShopModel.fromMap(json.decode(source));
}
