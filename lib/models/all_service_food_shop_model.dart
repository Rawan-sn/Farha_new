import 'dart:convert';

import 'link_model.dart';
import 'list_services_foodshop_model.dart';

class ServiceFoodShopModel {
  int currentPage;
  List<ListServiceFoodShopModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<LinksModel> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;
  ServiceFoodShopModel({
     this.currentPage,
     this.data,
     this.firstPageUrl,
     this.from,
     this.lastPage,
     this.lastPageUrl,
     this.links,
     this.nextPageUrl,
     this.path,
     this.perPage,
     this.prevPageUrl,
     this.to,
     this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'data': data?.map((x) => x.toMap())?.toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links?.map((x) => x.toMap())?.toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory ServiceFoodShopModel.fromMap(Map<String, dynamic> map) {
    return ServiceFoodShopModel(
      currentPage: map['current_page'],
      data: List<ListServiceFoodShopModel>.from(map['data']?.map((x) => ListServiceFoodShopModel.fromMap(x))),
      firstPageUrl: map['first_page_url'],
      from: map['from'],
      lastPage: map['last_page'],
      lastPageUrl: map['last_page_url'],
      links: List<LinksModel>.from(map['links']?.map((x) => LinksModel.fromMap(x))),
      nextPageUrl: map['next_page_url'],
      path: map['path'],
      perPage: map['per_page'],
      prevPageUrl: map['prev_page_url'],
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceFoodShopModel.fromJson(String source) => ServiceFoodShopModel.fromMap(json.decode(source));
}
