import 'dart:convert';

class BeautySectionModel {
  String name;
  int price;
  String description;
  BeautySectionModel({
    this.name,
    this.price,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }

  factory BeautySectionModel.fromMap(Map<String, dynamic> map) {
    return BeautySectionModel(
      name: map['name'],
      price: map['price'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BeautySectionModel.fromJson(String source) =>
      BeautySectionModel.fromMap(json.decode(source));
}
