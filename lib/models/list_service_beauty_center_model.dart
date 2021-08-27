import 'dart:convert';

import 'package:farha_app/models/image_model.dart';

class ListServiceBeautyCenterModel {
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
  ServiceDetails  serviceDetails;

  ListServiceBeautyCenterModel({
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
    this.serviceDetails,
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
      'service_details': serviceDetails.toMap(),
    };
  }

  factory ListServiceBeautyCenterModel.fromMap(Map<String, dynamic> map) {
    return ListServiceBeautyCenterModel(
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
      deletedAt: map['deleted_at'],
      images: List<ImageModel>.from(
          map['images']?.map((x) => ImageModel.fromMap(x))),
      serviceType: map['service_type'],
      serviceDetails: ServiceDetails.fromMap(map['service_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListServiceBeautyCenterModel.fromJson(String source) =>
      ListServiceBeautyCenterModel.fromMap(json.decode(source));
}

class ServiceDetails {
  int id;
  int serviceId;
  String type;
  String startTime;
  String endTime;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  List<Details> details;
  ServiceDetails({
    this.id,
    this.serviceId,
    this.type,
    this.startTime,
    this.endTime,
    this.createAt,
    this.updatedAt,
    this.deletedAt,
    this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'service_id': serviceId,
      'type': type,
      'start_time': startTime,
      'end_time': endTime,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'details': details?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ServiceDetails.fromMap(Map<String, dynamic> map) {
    return ServiceDetails(
      id: map['id'],
      serviceId: map['service_id'],
      type: map['type'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      details:
          List<Details>.from(map['details']?.map((x) => Details.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceDetails.fromJson(String source) =>
      ServiceDetails.fromMap(json.decode(source));
}

class Details {
  int id;
  String name;
  dynamic description;
  int price;
  int beautyCenterId;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  Details({
    this.id,
    this.name,
    this.description,
    this.price,
    this.beautyCenterId,
    this.createAt,
    this.updatedAt,
    this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'beauty_center_id': beautyCenterId,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      beautyCenterId: map['beautyCenterId'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Details.fromJson(String source) =>
      Details.fromMap(json.decode(source));
}
