//import 'dart:convert';
//
//class Venues {
//  int id;
//  int hallId;
//  String name;
//  int forMen;
//  int forWomen;
//  int forMix;
//  int capacity;
//  int price;
//  String image;
//  String createAt;
//  String updatedAt;
//  dynamic deletedAt;
//  List<int> type;
//
//  Map<String, dynamic> toMap() {
//    return {
//      'id': id,
//      'hallId': hallId,
//      'name': name,
//      'forMen': forMen,
//      'forWomen': forWomen,
//      'forMix': forMix,
//      'capacity': capacity,
//      'price': price,
//      'image': image,
//      'createAt': createAt,
//      'updatedAt': updatedAt,
//      'deletedAt': deletedAt,
//      'type': type,
//    };
//  }
//
//  factory Venues.fromMap(Map<String, dynamic> map) {
//    return Venues(
//      id: map['id'],
//      hallId: map['hallId'],
//      name: map['name'],
//      forMen: map['forMen'],
//      forWomen: map['forWomen'],
//      forMix: map['forMix'],
//      capacity: map['capacity'],
//      price: map['price'],
//      image: map['image'],
//      createAt: map['createAt'],
//      updatedAt: map['updatedAt'],
//      deletedAt: map['deletedAt'],
//      type: List<int>.from(map['type']),
//    );
//  }
//
//  String toJson() => json.encode(toMap());
//
//  factory Venues.fromJson(String source) => Venues.fromMap(json.decode(source));
//}
