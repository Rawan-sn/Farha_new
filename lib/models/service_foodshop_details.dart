
import 'dart:convert';

import 'package:farha_app/models/list_services_categories_foodshop.dart';

class ServiceFoodShopDetails {
  int id;
  int serviceId;
  String startTime;
  String endTime;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  List<ServiceCategoriesDetails> serviceCategoriesDetails;
  ServiceFoodShopDetails({
     this.id,
     this.serviceId,
     this.startTime,
     this.endTime,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
     this.serviceCategoriesDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'service_id': serviceId,
      'start_time': startTime,
      'end_time': endTime,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'categories': serviceCategoriesDetails?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ServiceFoodShopDetails.fromMap(Map<String, dynamic> map) {
    return ServiceFoodShopDetails(
      id: map['id'],
      serviceId: map['service_id'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      serviceCategoriesDetails: List<ServiceCategoriesDetails>.from(map['categories']?.map((x) => ServiceCategoriesDetails.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceFoodShopDetails.fromJson(String source) => ServiceFoodShopDetails.fromMap(json.decode(source));
}
