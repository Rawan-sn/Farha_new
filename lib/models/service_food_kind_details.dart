import 'dart:convert';

class ServiceFoodKindDetails {
  int id;
  int categoryId;
  String name;
  String description;
  String image;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  ServiceFoodKindDetails({
     this.id,
     this.categoryId,
     this.name,
     this.description,
     this.image,
     this.createAt,
     this.updatedAt,
     this.deletedAt,
  });




  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'image': image,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory ServiceFoodKindDetails.fromMap(Map<String, dynamic> map) {
    return ServiceFoodKindDetails(
      id: map['id'],
      categoryId: map['category_id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceFoodKindDetails.fromJson(String source) => ServiceFoodKindDetails.fromMap(json.decode(source));
}
