import 'dart:convert';

class FoodModel {
int id ;
int price;
int quantity;

  FoodModel({
     this.id,
     this.price,
     this.quantity,
  });




  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'quantity': quantity,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(json.decode(source));
}
