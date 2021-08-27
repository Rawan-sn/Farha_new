import 'dart:convert';

class HallFoodDetails {
  String name;
  String description;
  HallFoodDetails({
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory HallFoodDetails.fromMap(Map<String, dynamic> map) {
    return HallFoodDetails(
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HallFoodDetails.fromJson(String source) =>
      HallFoodDetails.fromMap(json.decode(source));
}
