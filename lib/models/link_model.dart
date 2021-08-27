import 'dart:convert';

class LinksModel {
  dynamic url;
  String lable;
  bool active;
  LinksModel({
    this.url,
    this.lable,
    this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'lable': lable,
      'active': active,
    };
  }

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
      url: map['url'],
      lable: map['lable'],
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinksModel.fromJson(String source) =>
      LinksModel.fromMap(json.decode(source));
}
