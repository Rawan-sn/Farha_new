import 'dart:convert';

import 'package:farha_app/models/food_categories_model.dart';

import '../beauty_section_model.dart';

class CreateFoodShopModel {
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
  List<FoodCategoriesModel> categories;
  
  CreateFoodShopModel({
     this.name,
     this.address,
     this.facebook,
     this.description,
     this.logo,
     this.phone,
     this.images,
     this.startTime,
     this.endTime,
     this.type,
     this.categories,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'facebook': facebook,
      'description': description,
      'logo': logo,
      'phone': phone,
      'images': images,
      'start_time': startTime,
      'end_time': endTime,
      'type': type,

      'categories': categories?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CreateFoodShopModel.fromMap(Map<String, dynamic> map) {
    return CreateFoodShopModel(
      name: map['name'],
      address: map['address'],
      facebook: map['facebook'],
      description: map['description'],
      logo: map['logo'],
      phone: map['phone'],
      images: List<String>.from(map['images']),
      startTime: map['startTime'],
      endTime: map['endTime'],
      type: map['type'],
      categories: List<FoodCategoriesModel>.from(map['categories']?.map((x) => FoodCategoriesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateFoodShopModel.fromJson(String source) => CreateFoodShopModel.fromMap(json.decode(source));
}
