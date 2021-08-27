import 'dart:convert';

import 'package:farha_app/models/food_model.dart';

class FoodCategoriesModel {
  int id;
  List<FoodModel> foodModel;
  FoodCategoriesModel({
     this.id,
     this.foodModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'foodModel': foodModel?.map((x) => x.toMap())?.toList(),
    };
  }

  factory FoodCategoriesModel.fromMap(Map<String, dynamic> map) {
    return FoodCategoriesModel(
      id: map['id'],
      foodModel: List<FoodModel>.from(map['foodModel']?.map((x) => FoodModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodCategoriesModel.fromJson(String source) => FoodCategoriesModel.fromMap(json.decode(source));
}

