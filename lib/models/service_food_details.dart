import 'dart:convert';

import 'package:farha_app/models/service_food_kind_details.dart';

class ServiceFoodDetails {
  int id;
  int price;
  int quantity;
  int foodId;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  int foodShopsCategoryId;
  ServiceFoodKindDetails serviceFoodKindDetails;
  ServiceFoodDetails({
     this.id,
     this.price,
     this.quantity,
     this.foodId,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
     this.foodShopsCategoryId,
     this.serviceFoodKindDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'quantity': quantity,
      'food_id': foodId,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'food_shops_category_id': foodShopsCategoryId,
      'food': serviceFoodKindDetails.toMap(),
    };
  }

  factory ServiceFoodDetails.fromMap(Map<String, dynamic> map) {
    return ServiceFoodDetails(
      id: map['id'],
      price: map['price'],
      quantity: map['quantity'],
      foodId: map['food_id'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
      foodShopsCategoryId: map['food_shops_category_id'],
      serviceFoodKindDetails: ServiceFoodKindDetails.fromMap(map['food']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceFoodDetails.fromJson(String source) => ServiceFoodDetails.fromMap(json.decode(source));
}
