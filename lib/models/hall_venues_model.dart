import 'dart:convert';

class VenusModel {
  String name;
  int capacity;
  int price;
  String image;
  bool forMen;
  bool forWomen;
  bool forMex;
  List<int> partyTypeVenus;
  VenusModel({
    this.name,
    this.capacity,
    this.price,
    this.image,
    this.forMen,
    this.forWomen,
    this.forMex,
    this.partyTypeVenus,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'capacity': capacity,
      'price': price,
      'image': image,
      'for_men': forMen,
      'for_women': forWomen,
      'for_mix': forMex,
      'party_type_venues': partyTypeVenus,
    };
  }

  factory VenusModel.fromMap(Map<String, dynamic> map) {
    return VenusModel(
      name: map['name'],
      capacity: map['capacity'],
      price: map['price'],
      image: map['image']?? "",
      forMen: map['for_men'],
      forWomen: map['for_women'],
      forMex: map['for_mix'],
      partyTypeVenus: List<int>.from(map['party_type_venues']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VenusModel.fromJson(String source) =>
      VenusModel.fromMap(json.decode(source));
}
