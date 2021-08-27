import 'dart:convert';

class UploadImageModel {
  String image;

  UploadImageModel({this.image});

  Map<String, dynamic> toMap() {
    return {'image': image};
  }

  factory UploadImageModel.fromMap(Map<String, dynamic> map) {
    return UploadImageModel(
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadImageModel.fromJson(String source) =>
      UploadImageModel.fromMap(json.decode(source));
}
