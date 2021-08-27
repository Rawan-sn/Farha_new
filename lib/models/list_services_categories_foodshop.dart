
import 'dart:convert';

import 'package:farha_app/models/service_food_details.dart';

class ServiceCategoriesDetails {
int id;
int foodShopId;
int foodCategoryId;
String createAt;
String updatedAt;
dynamic deletedAt;
String categoryName;
List<ServiceFoodDetails> serviceFoodDetails;
  ServiceCategoriesDetails({
     this.id,
     this.foodShopId,
     this.foodCategoryId,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
     this.categoryName,
     this.serviceFoodDetails,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'food_shop_id': foodShopId,
      'food_category_id': foodCategoryId,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'categoryName': categoryName,
      'food': serviceFoodDetails?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ServiceCategoriesDetails.fromMap(Map<String, dynamic> map) {
    return ServiceCategoriesDetails(
      id: map['id'],
      foodShopId: map['food_shop_id'],
      foodCategoryId: map['food_category_id'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      categoryName: map['categoryName'],
      serviceFoodDetails: List<ServiceFoodDetails>.from(map['food']?.map((x) => ServiceFoodDetails.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCategoriesDetails.fromJson(String source) => ServiceCategoriesDetails.fromMap(json.decode(source));
}
