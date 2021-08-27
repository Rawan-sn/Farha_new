import 'dart:convert';

import 'package:farha_app/models/hall_food_details.dart';
import 'package:farha_app/models/hall_venues_model.dart';

class CreateHallModel {
  String name;
  String address;
  String facebook;
  String description;
  String logo;
  String phone;
  List<String> images;
  String startTime;
  String endTime;
  bool weddingCar;
  bool dj;
  bool photography;
  List<HallFoodDetails> hallDetails;
  List<VenusModel> venus;
  CreateHallModel({
    this.name,
    this.address,
    this.facebook,
    this.description,
    this.logo,
    this.phone,
    this.images,
    this.startTime,
    this.endTime,
    this.weddingCar,
    this.dj,
    this.photography,
    this.hallDetails,
    this.venus,
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
      'wedding_car': weddingCar,
      'djs': dj,
      'photography': photography,
      'hall_details': hallDetails?.map((x) => x.toMap())?.toList(),
      'venues': venus?.map((x) => x.toMap())?.toList(),
    };
  }

  factory CreateHallModel.fromMap(Map<String, dynamic> map) {
    return CreateHallModel(
      name: map['name'],
      address: map['address'],
      facebook: map['facebook'],
      description: map['description'],
      logo: map['logo'],
      phone: map['phone'],
      images: List<String>.from(map['images'])?? [],
      startTime: map['start_time'],
      endTime: map['end_time'],
      weddingCar: map['wedding_car'],
      dj: map['djs'],
      photography: map['photography'],
      hallDetails: List<HallFoodDetails>.from(
          map['hall_details']?.map((x) => HallFoodDetails.fromMap(x))),
      venus: List<VenusModel>.from(
          map['venues']?.map((x) => VenusModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateHallModel.fromJson(String source) =>
      CreateHallModel.fromMap(json.decode(source));
}
