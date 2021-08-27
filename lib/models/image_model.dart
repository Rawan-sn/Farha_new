import 'dart:convert';

class ImageModel {
  int id;
  String image;
  int serviceId;
  String createAt;
  String updatedAt;
  dynamic deletedAt;
  ImageModel({
    this.id,
    this.image,
    this.serviceId,
    this.createAt,
    this.updatedAt,
    this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'service_id': serviceId,
      'created_at': createAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      image: map['image'],
      serviceId: map['service_id'],
      createAt: map['created_at'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));
}
